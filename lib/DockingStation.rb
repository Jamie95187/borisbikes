require_relative 'bike'

class DockingStation
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  DEFAULT_CAPACITY = 20

  def release_bike
    fail "No bikes available" if empty?

    @bikes.pop
  end

  def dock_bike(bike)
    return raise("Already max capacity") if full?

    @bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
