class Station
  attr_reader :name

  def initialize(name) 
    @name = name
    @trains = []
  end

  def arrivals(train) 
    @trains << train
  end
  
  def departures(train) 
    @trains.delete(train)
  end

  def trains_by_type(type) 
    @trains.select { |train| train.type == type } 
  end
end  

class Route
  attr_reader :stations

  def initialize(departure, arrival) 
    @stations = [departure, arrival]
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

class Train
  attr_reader :number, :type, :car, :current_speed, :route

  def initialize(number, type, car)
    @number = number
    @type = type
    @car = car
    @current_speed = 0
  end

  def acceleration(speed)
    @current_speed += speed
  end
  
  def stop(speed)
    @current_speed -= speed
    @current_speed = 0 if @current_speed < 0 
  end

  def add_car
    @car +=1 if @current_speed.zero?
  end

  def remove_car
    @car -=1 if @current_speed.zero? && @car != 0
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
    @route.stations[@current_station + 1] unless current_station == @route.stations.last
  end

  def previous_station
    @route.stations[@current_station - 1] unless current_station == @route.stations.first
  end
end  
