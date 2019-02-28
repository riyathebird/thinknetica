require_relative 'manufacturer'
require_relative 'instance_counter'
# describe the train behavior
class Train
  include Manufacturer
  include InstanceCounter
  NUMBER_VALID = /^[a-z0-9]{3}\-?[a-z0-9]{2}$/i
  attr_reader :number, :cars, :current_speed, :type

  @@train = {}

  def initialize(number, type)
    @number = number
    @type = type
    @cars = []
    @current_speed = 0
    @@train[number] = self
    validate!
    register_instances
  end

  def self.find(number)
    @@train[number]
  end

  def acceleration(speed)
    @current_speed += speed
  end

  def stop(speed)
    @current_speed -= speed
    @current_speed = 0 if @current_speed < 0
  end

  def get_the_route(route)
    @route = route
    @current_station = 0
    current_station.arrivals(self)
  end

  def moves_forward
    if next_station
      current_station.departures(self)
      @current_station += 1
      current_station.arrivals(self)
    end
  end

  def moves_backward
    if previous_station
      next_station.departures(self)
      @current_station -= 1
      current_station.arrivals(self)
    end
  end

  def current_station
    @route.stations[@current_station]
  end

  def next_station
    @route.stations[@current_station + 1] unless last_station?
  end

  def previous_station
    @route.stations[@current_station - 1] unless first_station?
  end

  def cargo?
    type == 'cargo'
  end

  def passenger?
    type == 'passenger'
  end

  def add_car(car)
    @cars << car if stopped?
  end

  def remove_car(car)
    @cars.delete(car) if stopped?
  end

  def valid?
    validate!
    true
  rescue StandartError
    false
  end

  def each_car
    @cars.each { |car| yield(car) }
  end

  protected

  def validate!
    raise 'The number is empty' if @number.nil?
    raise 'The number is not valid' if @number !~ NUMBER_VALID
  end

  def stopped?
    @current_speed = 0
  end

  def last_station?
    @current_station == @route.stations.last
  end

  def first_station?
    @current_station == @route.stations.first
  end
end
