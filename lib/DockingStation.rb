require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No bikes available" unless !@bikes.empty?
    @bikes.pop
  end

  def dock_bike(bike)
    @bikes << bike
  end
end
