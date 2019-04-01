module Accessors
  def attr_accessor_with_history(*names)
    names.each { |name| define_accessor("@#{name}") }
  end

  def define_accessor(name)
    var_name = "@#{name}".to_sym
    history = "@#{name}_history".to_sym

    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      if instance_variable_get(var_name).nil?
        instance_variable_set(hystory, [])
      else
        instance_variable_get(history) << instance_variable_get(var_name)
      end
      instance_variable_set(var_name, value)
    end
    define_method("#{name}_history".to_sym) { instance_variable_get(history) }
  end

  def strong_attr_accessor(name, class_name)
    var_name = "@#{name}".to_sym

    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise 'Incorrect type' unless value.is_a?(class_name)

      instance_variable_set(var_name, value)
    end
  end
end