require_relative 'car'

class PassengerCar < Car
  attr_reader :space

  def initialize(number, space)
    super("passenger", number, space)
    @taken_seats = 0
  end  

  def taken_seats
    return @taken_seats
    return "All seats are taken" if @taken_seats == @space
  end

  def take_a_seat
    @taken_seats += 1
  end

  def empty_seats
    return @space - @taken_seats
  end
end
