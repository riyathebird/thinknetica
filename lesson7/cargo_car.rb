require_relative 'car'

class CargoCar < Car
  attr_reader :space

  def initialize(number, space)
    super("cargo", number, space)
  end  
end
