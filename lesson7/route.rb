require_relative 'instance_counter'

class Route
  include InstanceCounter
  
  attr_reader :stations, :name

  def initialize(departure, arrival) 
    @stations = [departure, arrival]
    @name = "Departure: #{departure.name} - Arrival: #{arrival.name}"
    validate!
  end

  def add(station) 
    @stations.insert(-2, station)
  end
  
  def delete(station)
    @stations.delete(station) unless [@stations.first, @stations.last].include?(station)
  end

  def all_stations 
    @stations.each { |station| puts station }
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise 'Stations are equal' if @stations.first == @stations.last
  end
end 
