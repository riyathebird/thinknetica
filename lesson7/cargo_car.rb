require_relative 'car'

class CargoCar < Car

  def initialize(number)
    super("cargo", number)
  end  
end
