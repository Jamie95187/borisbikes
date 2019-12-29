require_relative 'Bike'
require_relative 'BikeContainer'

class Garage
  include BikeContainer

  def fix_bikes
    bikes.map { |bike| bike.fix }
  end
end
