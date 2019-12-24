require 'dockingstation'

describe DockingStation do

  describe '#release_bike' do

    it 'should respond to release_bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      p subject.bikes.size
      expect(subject).to respond_to(:release_bike)
    end

    it 'should get a bike that is working from the station' do
      bike = Bike.new
      subject.dock_bike(bike)
      bike = subject.release_bike
      expect(bike.working?).to be true
    end

  end

  it{is_expected.to respond_to(:dock_bike).with(1).argument}

  it 'should add a bike to the bikes' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.bikes.size).to eq 1
  end

  it'should raise an error if there are no bikes available to release' do
    expect{ subject.release_bike }.to raise_error("No bikes available")
  end
end
