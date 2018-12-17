require_relative 'manufacturer'

class Car
  attr_reader :type, :number

  def initialize(type, number)
    include Manufacturer
    @type = type
    @number = number
    validate!
  end

  def passenger_car?
    @type == "passenger"
  end  

  def cargo_car?
    @type == "cargo"
  end  

  def valid?
    validate!
    true
  rescue
    false
  end

protected

  def validate!
    raise 'Invalid type' unless type.eql?('cargo') || type.eql?('passenger')
  end  
end
