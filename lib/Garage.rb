class Garage
  attr_reader :storage

  MAXIMUM_CAPCITY = 50
  def initialize(capacity = MAXIMUM_CAPCITY)
    @capacity = capacity
    @storage = []
  end

end
