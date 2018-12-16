require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@stations = 0

  def initialize(name) 
    @@stations += 1
    @name = name
    @trains = []
    @@stations << self
    register_instances
  end

  def self.all
    @@stations
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
