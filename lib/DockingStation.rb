require_relative 'bike'

class DockingStation
  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  DEFAULT_CAPACITY = 20

  def release_bike
    fail "No bikes available" if empty?
    fail "No working bikes available" unless working?

    @bikes.delete_at(find_first_working_index)
  end

  def dock_bike(bike)
    return raise("Already max capacity") if full?

    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

  def working?
    @bikes.each { |bike| return true if bike.working? }
    false
  end

  def find_first_working_index
    @bikes.find_index { |bike| bike.working? }
  end
end
