require_relative 'manufacturer'

class Car
  attr_reader :type, :number

  def initialize(type, number)
    include Manufacturer
    @type = type
    @number = number
  end

  def passenger_car?
    @type == "passenger"
  end  

  def cargo_car?
    @type == "cargo"
  end  
end
