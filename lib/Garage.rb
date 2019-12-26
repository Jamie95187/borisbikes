require_relative 'bike'

class Garage
  attr_reader :storage

  MAXIMUM_CAPCITY = 50
  def initialize(capacity = MAXIMUM_CAPCITY)
    @capacity = capacity
    @storage = []
  end

  def fix_bikes
    @storage.map { |bike| bike.fix }
  end
end
