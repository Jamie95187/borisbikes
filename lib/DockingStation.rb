require_relative 'Bike'
require_relative 'BikeContainer'

class DockingStation
  include BikeContainer

  def release_bike
    fail 'No working bikes available' if working_bikes.empty?
    
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
    bikes.select { |bike| bike.working? }
  end

  def broken_bikes
    bikes.reject { |bike| bike.working? }
  end

end
