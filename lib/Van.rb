require_relative 'dockingstation'

class Van
  include BikeContainer

  def load(station)
    fail 'No space left in van' if full?
    add_bike station.get_broken_bike
    bikes
  end

  def unload(garage)
    populate_garage(garage)
    bikes.clear
  end

  def populate_garage(garage)
    bikes.each { |bike| garage.add_bike bike && remove_bike }
  end

  def get_fixed_bikes(garage)
    garage.bikes.each { |bike| @bikes << bike if bike.working? }
    bikes
  end

  def distribute_bikes(station)
    bikes.each { |bike| station.dock(bike) if bike.working? }
    remove_bike
  end

end
