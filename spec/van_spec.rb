require 'van'

describe Van do
  let(:bike) { double :bike }
  let(:station) { double :dockingstation }
  let(:garage) { double :garage }

  describe '#get_bikes' do
    let(:bike2) { double :bike }
    let(:bike3) { double :bike }

    context 'only one broken bike at station' do

      it 'should take all the broken bikes from the station' do
        allow(bike).to receive(:working?).and_return false
        allow(station).to receive(:dock_bike).with(bike)
        station.dock_bike(bike)
        allow(station).to receive(:bikes).and_return([bike])
        expect(subject.get_bikes(station)).to eq [bike]
      end

    end

    context 'and one working bike' do

      it 'should add two bikes to the van' do
        allow(bike).to receive(:working?).and_return false
        allow(bike2).to receive(:working?).and_return true
        allow(bike3).to receive(:working?).and_return false
        allow(station).to receive(:dock_bike).with(bike)
        allow(station).to receive(:dock_bike).with(bike2)
        allow(station).to receive(:dock_bike).with(bike3)
        station.dock_bike(bike)
        station.dock_bike(bike2)
        station.dock_bike(bike3)
        allow(station).to receive(:bikes).and_return([bike, bike2, bike3])
        expect(subject.get_bikes(station)).to eq [bike, bike3]
      end

    end

  end

  describe '#unload_bikes' do

    it 'should unload all the bikes from the van' do
      allow(bike).to receive(:working?).and_return false
      allow(station).to receive(:dock_bike).with(bike)
      allow(station).to receive(:bikes).and_return([bike])
      allow(garage).to receive(:storage).and_return []
      station.dock_bike(bike)
      subject.get_bikes(station)
      subject.unload_bikes(garage)
      expect(subject.bikes.count).to eq 0
    end

  end

  describe '#get_fixed_bikes' do

    it 'should retrieve the fixed bikes from the garage' do
      allow(bike).to receive(:working?).and_return true
      allow(garage).to receive(:storage).and_return [bike]
      subject.get_fixed_bikes(garage)
      expect(subject.bikes).to eq [bike]
    end

  end

  describe '#distribute_bikes' do

    it 'should distribute the bikes to the station' do
      allow(bike).to receive(:working?).and_return true
      allow(garage).to receive(:storage).and_return [bike]
      allow(station).to receive(:dock_bike).with bike
      allow(station).to receive(:bikes).and_return [bike]
      subject.get_fixed_bikes(garage)
      subject.distribute_bikes(station)
      expect(subject.bikes).to eq []
    end

  end

end
