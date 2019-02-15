require_relative 'manufacturer'

class Car
  include Manufacturer
  attr_reader :type, :number, :space

  def initialize(type, number, space)
    @type = type
    @number = number
    @space = space
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
