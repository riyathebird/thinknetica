module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(name, type, parameters = nil)
      self.validations ||= []
      self.validations << { name: name, type: type, parameters: parameters }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        name_value = instance_variable_get("@#{validation[:name]}")
        type_value = "validate_#{validation[:type]}"
        send(name_value, type_value, validation[:parameters])
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    private

    def validate_presence(value, _parameters)
      raise 'Value can\'t be empty' if value.to_s.empty?
    end

    def validate_format(value, format)
      raise 'Incorect value format' if value !~ format
    end

    def validate_type(value, type)
      raise 'Incorect value type' unless value.is_a?(type)
    end
  end
end
