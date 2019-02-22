require_relative 'train'
# inheritance from the parent of train class
class CargoTrain < Train
  def initialize(number)
    super(number, 'cargo')
  end

  def add_car(car)
    super if car.cargo_car?
  end

  def remove_car(car)
    super if car.cargo_car?
  end
end
