class Route
  attr_reader :stations, :name

  def initialize(departure, arrival) 
    @stations = [departure, arrival]
    @name = "Departure: #{departure.name} - Arrival: #{arrival.name}"
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
end 