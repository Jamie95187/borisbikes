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
    fail "Already at max capacity" unless @bikes.size < 1
    @bikes << bike
  end
end
