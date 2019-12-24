require 'dockingstation'

describe DockingStation do

  it 'should respond to release_bike' do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'should get a bike that is working from the station' do
    bike = subject.release_bike
    expect(bike.isWorking?).to be true
  end

end
