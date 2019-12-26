class Van
  attr_reader :bikes

  MAXIMUM_CAPCITY = 15

  def initialize(capacity = MAXIMUM_CAPCITY)
    @capacity = capacity
    @bikes = []
  end

  def get_bikes(station)
    station.bikes.each { |bike| @bikes << bike unless bike.working? }
    @bikes
  end

  def unload_bikes(garage)
    garage.storage << @bikes.pop until @bikes.count == 0
  end

end
