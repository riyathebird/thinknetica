require_relative 'instance_counter'

class Station
  include InstanceCounter
  attr_reader :name, :trains

  @@stations = []

  def initialize(name) 
    @name = name
    @trains = []
    @@stations << self
    validate!
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

  def valid?
    validate!
    true
  rescue
    false
  end

  def each_train
    @trains.each { |train| yield(train) }
  end  

protected

  def validate!
    raise 'The station name is too short' if name.size < 2
  end  
end  
