require_relative 'instance_counter'

class Station
  attr_reader :name, :trains

  def initialize(name) 
    include InstanceCounter
    @name = name
    @trains = []
    @@stations << self
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

  def self.all
    @@stations
end  
