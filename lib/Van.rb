require_relative 'dockingstation'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def get_bikes(station)
    station.bikes.each { |bike| @bikes << bike if !bike.working? }
  end

end
