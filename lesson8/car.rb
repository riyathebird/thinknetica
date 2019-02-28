require_relative 'manufacturer'
# a car class - describes cars methods for the train, parent for cargo & passenger cars
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
    @type == 'passenger'
  end

  def cargo_car?
    @type == 'cargo'
  end

  def valid?
    validate!
    true
  rescue StandartError
    false
  end

  def take_a_space(unit)
    @taken_space += unit if @space >= unit
  end

  def free_space
    @space - @taken_space
  end

  protected

  def validate!
    raise 'Invalid type' unless type.eql?('cargo') || type.eql?('passenger')
  end
end
