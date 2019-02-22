require_relative 'car'
# a cargo car class - inheritance from the parent car class
class CargoCar < Car
  attr_reader :space

  def initialize(number, space)
    super('cargo', number, space)
  end
end
