require_relative 'car'

class CargoCar < Car
  attr_reader :space

  def initialize(number, space)
    super("cargo", number, space)
    @taken_volume = 0
  end  

  def taken_volume
    return @taken_volume
    return "All volume is taken" if @taken_volume == @space
  end

  def take_a_volume(volume)
    @taken_volume += volume
  end

  def empty_volume
    @space - @taken_volume
  end
end
