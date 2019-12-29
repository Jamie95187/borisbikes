require 'dockingstation'
require 'support/shared_examples_for_bike_container'

describe DockingStation do
  it_behaves_like BikeContainer

  let(:bike) { double :bike }

  describe '#dock' do

    it 'should dock a bike' do
      subject.dock bike
      expect(subject.empty?).to be_falsey
    end

  end

  describe '#release_bike' do

    it 'should return a working bike' do
      allow(bike).to receive(:working?).and_return true
      subject.dock bike
      expect(subject.release_bike).to eq bike
    end

    it 'should release a bike' do
      allow(bike).to receive(:working?).and_return true
      subject.dock bike
      subject.release_bike
      expect(subject.empty?).to be_truthy
    end

    it 'should raise an error when no bikes are working' do
      bike = double :bike, working: false
      allow(bike).to receive(:working?).and_return false
      subject.dock bike
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end

  end

  describe '#get_broken_bike' do

    it 'should raise error when there are no broken bikes' do
      allow(bike).to receive(:working?).and_return true
      expect { subject.get_broken_bike }.to raise_error 'No broken bikes'
    end

    it 'should return a broken bike' do
      bike = double :bike, working: false
      allow(bike).to receive(:working?).and_return false
      subject.dock bike
      expect(subject.get_broken_bike).to eq bike
      expect(subject.empty?).to be_truthy
    end

  end

end
