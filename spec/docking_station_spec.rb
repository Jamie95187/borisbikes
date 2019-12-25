require 'dockingstation'

describe DockingStation do

  describe 'initialization' do

    subject { DockingStation.new }
    let(:bike) { double :bike }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times { subject.dock_bike(bike) }
      expect { subject.dock_bike(bike) }.to raise_error(RuntimeError, "Already max capacity")
    end

  end

  describe '#release_bike' do

    let(:bike) { double :bike}
    it 'should respond to release_bike' do
      subject.dock_bike(bike)
      expect(subject).to respond_to(:release_bike)
    end

    it 'should get a bike that is working from the station' do
      subject.dock_bike(bike)
      allow(bike).to receive(:working?).and_return true
      expect(bike.working?).to be true
    end

    it 'should raise an error if there are no bikes available to release' do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end

    context ' With a broken bike' do
      let(:bike) { double :bike }

      it 'should raise an error if the bike is broken' do
        # Bike is broken
        subject.dock_bike(bike)
        allow(bike).to receive(:working?).and_return(false)
        expect(bike.working?).to be false
        expect { subject.release_bike }.to raise_error("No working bikes available")
      end

      context 'and a working bike' do

        let(:bike2) { double :bike }
        it 'releases a working bike' do
          allow(bike).to receive(:working?).and_return(false)
          allow(bike2).to receive(:working?).and_return(true)
          subject.dock_bike bike
          subject.dock_bike bike2
          expect(bike2.working?).to be true
          expect { subject.release_bike }.not_to raise_error
        end

      end

    end

  end

  describe '#dock_bike' do

    let(:bike) { double :bike }
    it { is_expected.to respond_to(:dock_bike).with(1).argument }

    it 'should add a bike to the bikes' do
      expect(subject.dock_bike(bike).size).to eq 1
    end

  end

  it 'has a capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  context 'a broken bike' do

    let(:bike) { double :bike }
    it 'returns a broken bike with no error' do
      expect { subject.dock_bike(bike) }.not_to raise_error
    end

  end

end
