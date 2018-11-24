class Station
  attr_reader :name, :trains

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