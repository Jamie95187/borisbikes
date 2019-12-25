require 'dockingstation'

describe DockingStation do

  describe 'initialization' do

    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.dock_bike(bike) }
      expect { subject.dock_bike(bike) }.to raise_error(RuntimeError, "Already max capacity")
    end

  end

  describe '#release_bike' do

    it 'should respond to release_bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject).to respond_to(:release_bike)
    end

    it 'should get a bike that is working from the station' do
      bike = Bike.new
      subject.dock_bike(bike)
      bike = subject.release_bike
      expect(bike.working?).to be true
    end

    it 'should raise an error if there are no bikes available to release' do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end

  end

  describe '#dock_bike' do

    it { is_expected.to respond_to(:dock_bike).with(1).argument }

    it 'should add a bike to the bikes' do
      expect(subject.dock_bike(Bike.new).size).to eq 1
    end

  end

  it 'has a capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

end
