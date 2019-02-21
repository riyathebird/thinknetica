require_relative 'manufacturer'

class Car
  include Manufacturer
  attr_reader :type, :number, :space, :taken_space

  def initialize(type, number, space)
    @type = type
    @number = number
    @space = space
    @taken_space = 0
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

  def take_a_space(space)
    @taken_space += space
    raise "All space is taken" if @taken_space > @space
  end

  def free_space
    @space - @taken_space
  end

protected

  def validate!
    raise 'Invalid type' unless type.eql?('cargo') || type.eql?('passenger')
  end  
end
