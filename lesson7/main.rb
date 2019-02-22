require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'car'
require_relative 'passenger_car'
require_relative 'cargo_car'

class Main

  def initialize
    @stations = []
    @trains = []
    @cars = []
    @routes = []
  end  

  def menu
    loop do
      puts "Put 1 to create a station"
      puts "Put 2 to create a train"
      puts "Put 3 to create a route"
      puts "Put 4 to set a route to the train"
      puts "Put 5 to add the car"
      puts "Put 6 to remove the car"  
      puts "Put 7 to add a station in the route" 
      puts "Put 8 to remove a station in the route"
      puts "Put 9 to move the train forward"
      puts "Put 10 to move the train backward"
      puts "Put 11 to display full trains information on all stations"
      puts "Put 12 to take a space in the car"
      puts "To continue put a number of your next step, otherwise put \"exit\""

      input = gets.chomp
      create_a_station if input == "1" 
      create_a_train if input == "2" 
      create_a_route if input == "3" 
      set_a_route if input == "4" 
      cars_add if input == "5"
      cars_delete if input == "6"
      add_a_station if input == "7"
      remove_a_station if input == "8"
      move_forward if input == "9"
      move_backward if input == "10"
      trains_on_station_list if input == "11"
      take_a_space if input == "12"
      break if input == "exit"
    end
  end  

private
  def create_a_station 

    begin
      puts "Enter the station name:"
      station_name = gets.chomp
      if station_exists?(station_name)
        puts "This station is already exist"
      else  
        @stations << Station.new(station_name)
        puts "The station is created"
      end  
    rescue RuntimeError => e
      puts e
      retry
    end  
  end

  def create_a_train!(number, type)
    case type
    when "1"
      @trains << PassengerTrain.new(number)
    when "2"
      @trains << CargoTrain.new(number)
    end
  end

  def create_a_train 

    begin
      puts "Enter the train's number:"
      number = gets.chomp
      if train_exists?(number)
        puts "This train's number is already exist"
      else  
        puts "Print \"1\" for passenger or \"2\" for cargo train's type"
        type = gets.chomp
        create_a_train!(number, type)
        puts "The train number #{number} is created"  
      end  
    rescue RuntimeError => e
      puts e
      retry
    end  
  end

  def create_a_route
    if @stations.size >=2
      puts "Select a station index from the list:"
      display_stations
      puts "Enter the first station index"
      first = gets.to_i - 1
      puts "Enter the last station index"
      last = gets.to_i - 1
      first_station = @stations[first]
      last_station = @stations[last]
      if !first_station.nil? && !last_station.nil?
        @routes << Route.new(first_station, last_station)
        puts "The route is created"
      else
        puts "This stations do not exist. Enter stations from the list!"  
      end  
    else 
      puts "Create at least two stations"  
    end  
  end

  def set_a_route
    if !@trains.empty? && !@routes.empty?
      display_trains
      train = gets.to_i
      display_routes
      route = gets.to_i
      if !@trains[train - 1].nil? && !@routes[route - 1].nil?
        @trains[train - 1].get_the_route(@routes[route - 1])
        puts "The route is set"
      else 
        puts "Choose the correct index for the train and the route"  
      end  
    else
      puts "Create a train and a route"  
    end  
  end  

  def add_a_station
    if !@routes.empty?
      display_routes
      route = gets.to_i
      puts "To add station to the route - "
      display_stations
      station = gets.to_i
      if !@routes[route - 1].nil? && !@stations[station - 1].nil?
        @routes[route - 1].add(@stations[station - 1])
        puts "The station is added"
      else 
        puts "Choose the correct index the route and the station"
      end       
    else
      puts "Create a route first"
    end    
  end

  def remove_a_station
    if !@routes.empty?
      display_routes
      route = gets.to_i
      puts "To delete the station - "
      display_stations
      station = gets.to_i
      if !@routes[route - 1] && !@stations[station - 1]
        @routes[route - 1].delete(@stations[station - 1])
        puts "The station is removed"
      else 
        puts "Choose the correct index the route and the station"
      end    
    else
      puts "Create a route first"
    end   
  end  

  def cars_add 
    if !@trains.empty?
      display_trains
      train = gets.to_i
      train = @trains[train - 1]  
      if !train.nil? && train.passenger? 
        puts "Enter the car number"
        car_number = gets.to_i
        puts "Enter the number of seats"
        seats = gets.to_i
        passenger_car = PassengerCar.new(car_number, seats)
        train.add_car(passenger_car) 
        @cars << passenger_car
        puts "The car is added to a passenger train"
      elsif !train.nil? && train.cargo?
        puts "Enter the car number"
        car_number = gets.to_i
        puts "Enter the car volume"
        volume = gets.to_i
        cargo_car = CargoCar.new(car_number, volume)
        train.add_car(cargo_car) 
        @cars << cargo_car
        puts "The car is added to a cargo train"
      else
        puts "Enter the correct train index"  
      end  
    else
      puts "Create a train first"
    end  
  end

  def cars_delete
    if !@trains.empty? && !@cars.empty?
      display_trains 
      train = gets.to_i
      train = @trains[train - 1]
      puts "Select a car index you want to remove from the list:"
      display_cars
      car_number = gets.to_i
      car = @cars[car_number - 1]
      if !train.nil? && !car.nil?
        train.remove_car(car)
        @cars.delete(car)
        puts "The car is removed"
      else
        puts "Enter the correct train & car index"
      end   
    else
      puts "Create a train with cars first"
    end    
  end

  def move_forward
    if !@trains.empty?
      display_trains
      train = gets.to_i
      if !@trains[train - 1].nil?
        @trains[train - 1].moves_forward
        puts "The train moves forward"
      else
        puts "Enter the correct train index"
      end    
    else
      puts "Create a train first"
    end  
  end

  def move_backward
    if !@trains.empty?
      display_trains
      train = gets.to_i
      if !@trains[train - 1].nil?
        @trains[train - 1].moves_backward
        puts "The train moves backward"
      else
        puts "Enter correct train index"
      end    
    else
      puts "Create a train first"
    end  
  end

  def trains_on_station_list
    if !@trains.empty? && !@stations.empty?
      @stations.each do |station| 
        puts "Station name: #{station.name}"
        station.each_train do |train| 
          puts "#{train.type} train number: #{train.number}, cars: #{train.cars.size} "
          train.each_car do |car| 
            if car.passenger_car?
              puts "Car number: #{car.number}, available seats: #{car.free_space}"
              puts "taken seats:#{car.taken_space}"
            else
              puts "Car number: #{car.number}, available volume: #{car.free_space}"
              puts "taken volume: #{car.taken_space}"
            end
          end  
        end
      end
    else  
      puts "Create a train and a station first"
    end  
  end

  def take_a_space
    if !@cars.empty? && !@trains.empty?
      display_trains
      train = gets.to_i
      train = @trains[train - 1]  
      display_cars
      car = gets.to_i - 1
      if train.cars[car].passenger_car?
        train.cars[car].take_a_space
        puts "The seat is taken"
      else
        puts "Insert the volume you want to take"
        volume = gets.to_i
        train.cars[car].take_a_space(volume)
        puts "The volume is taken"
      end   
    else
      puts "Create a train with cars first"
    end    
  end  

  def display_trains
    puts "Select the train's index from the list:"
    @trains.each_with_index { |train, index| puts "index: #{index + 1} -  train number: #{train.number}" }
  end 

  def display_stations 
    @stations.each_with_index { |station, index| puts "index: #{index + 1} - station name: #{station.name}" }
  end

  def display_routes
    puts "Select the route's index from the list:"
    @routes.each_with_index { |route, index| puts "index: #{index + 1} - the route destinations: #{route.name}" }
  end

  def display_cars
    @cars.each_with_index { |car, index| puts "index: #{index + 1} - #{car.type} car number: #{car.number}" }
  end  

  def station_exists?(station_name)
    @stations.map {|station| station.name }.include?(station_name)
  end  

  def train_exists?(number)
    @trains.map {|train| train.number }.include?(number)
  end  
end    

Main.new.menu