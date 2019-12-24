require 'dockingstation'

describe DockingStation do

  it 'should respond to release_bike' do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'should get a bike that is working from the station' do
    bike = subject.release_bike
    expect(bike.working?).to be true
  end

  it{is_expected.to respond_to(:dock_bike).with(1).argument}

  it 'should add a bike to the bikes' do
    bike = subject.release_bike
    subject.dock_bike(bike)
    expect(subject.bikes.size).to eq 1
  end

end
