require_relative 'bike'

class DockingStation
  include BikeContainer

  def release_bike
    fail 'No bikes available' if working_bikes.empty?
    bikes.delete working_bikes.pop
  end

  def dock(bike)
    add_bike bike
  end

  def get_broken_bike
    fail 'No broken bikes' if broken_bikes.empty?
    bikes.delete broken_bikes.pop
  end

  private

  def working_bikes
    bikes.reject{ |bike| !bike.working? }
  end

  def broken_bikes
    bikes.reject{ |bike| bike.working? }
  end

end
