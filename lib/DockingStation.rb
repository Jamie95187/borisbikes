require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize(bikes = [])
    @bikes = bikes
  end

  def release_bike
    fail "No bikes available" if empty?

    @bikes.pop
  end

  def dock_bike(bike)
    fail "Already at max capacity" if full?
    
    @bikes << bike
  end

  private

  def full?
    @bikes.count == 20
  end

  def empty?
    @bikes.count.zero?
  end

end
