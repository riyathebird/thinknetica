require_relative 'car'

class PassengerCar < Car
  attr_reader :space

  def initialize(number, space)
    super("passenger", number, space)
  end  

  def take_a_space
    if @taken_space < @space
      @taken_space += 1
    end  
  end

end
