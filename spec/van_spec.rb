require 'van'

describe Van do
  let(:bike) { double :bike }
  let(:station) { double :dockingstation }
  let(:garage) { double :garage }

  describe '#load' do
    let(:bike2) { double :bike }
    let(:bike3) { double :bike }

    context 'one broken bike' do

      it 'should add one bike to the van' do
        allow(bike).to receive(:working?).and_return false
        allow(station).to receive(:dock).with(bike)
        allow(station).to receive(:get_broken_bike).and_return bike
        allow(station).to receive(:bikes).and_return([bike])
        expect(subject.load(station)).to eq [bike]
      end

    end

  end

  describe '#unload' do

    it 'should unload all the bikes from the van' do
      allow(bike).to receive(:working?).and_return false
      allow(garage).to receive(:add_bike).with bike
      allow(station).to receive(:get_broken_bike).and_return bike
      subject.load(station)
      subject.unload(garage)
      expect(subject.empty?).to be_truthy
    end

  end

  describe '#get_fixed_bikes' do

    it 'should retrieve the fixed bikes from the garage' do
      allow(bike).to receive(:working?).and_return true
      allow(garage).to receive(:bikes).and_return [bike]
      allow(garage).to receive(:remove_bike).and_return bike
      subject.get_fixed_bikes(garage)
      expect(subject.empty?).to be_falsey
    end

  end

  describe '#distribute_bikes' do

    it 'should distribute the bikes to the station' do
      allow(bike).to receive(:working?).and_return true
      allow(garage).to receive(:bikes).and_return [bike]
      allow(station).to receive(:dock).with bike
      allow(garage).to receive(:remove_bike).and_return bike
      subject.get_fixed_bikes(garage)
      subject.distribute_bikes(station)
      expect(subject.empty?).to be_truthy
    end

  end

end
