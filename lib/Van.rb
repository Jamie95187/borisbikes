require_relative 'dockingstation'

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
    populate_garage(garage)
    @bikes.clear
  end

  def populate_garage(garage)
    @bikes.each { |bike| garage.storage << bike }
  end

  def get_fixed_bikes(garage)
    garage.storage.each { |bike| @bikes << bike if bike.working? }
    @bikes
  end

  def distribute_bikes(station)
    @bikes.each { |bike| station.dock_bike(bike) if bike.working? }
    @bikes -= station.bikes
  end

end
