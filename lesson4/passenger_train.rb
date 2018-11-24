require_relative 'train'

class PassengerTrain < Train

  def initialize(number)
    super(number, "passenger")
  end  

  def add_car(car)
    super if car.passenger_car?
  end

  def remove_car(car)
    super if car.passenger_car?
  end
end  