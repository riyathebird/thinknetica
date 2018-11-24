require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter
  attr_reader :number, :cars, :current_speed, :type

  @@trains = []

  def initialize(number, type)
    @number = number
    @type = type
    @cars = []
    @current_speed = 0
    @@trains << self
    register_instances
  end

  def self.find(number)
    @@trains.select {|train| train.number == number}
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
    type == "cargo"
  end

  def passenger?
    type == "passenger"
  end

  def add_car(car)
    @cars << car if stopped?
  end

  def remove_car(car)
    @cars.delete(car) if stopped?
  end
    
  protected 

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
