class Car
  attr_reader :type, :number

  def initialize(type, number)
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