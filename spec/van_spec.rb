require 'van'

describe Van do

  let(:bike) { double :bike }
  let(:bike2) { double :bike }
  let(:bike3) { double :bike }
  let(:station) { double :dockingstation }

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
