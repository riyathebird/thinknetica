require_relative 'car'

class PassengerCar < Car

  def initialize(number)
    super("passenger", number)
  end  
end
