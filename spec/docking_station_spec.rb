require 'dockingstation'

describe DockingStation do

  it 'should release a bike' do
    ds = DockingStation.new
    expect(ds).to respond_to(:release_bike)
  end

end
