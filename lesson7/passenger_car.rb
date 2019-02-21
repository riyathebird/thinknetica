require_relative 'car'

class PassengerCar < Car
  attr_reader :space

  def initialize(number, space)
    super("passenger", number, space)
  end  
end
