require_relative 'car'
# a passenger car class - inheritance from the parent car class
class PassengerCar < Car
  attr_reader :space

  def initialize(number, space)
    super('passenger', number, space)
  end

  def take_a_space
    @taken_space += 1 if @space >= 1
  end
end
