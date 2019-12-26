require 'garage'

describe Garage do
  let(:station) { DockingStation.new }
  let(:van) { Van.new }
  let(:bike) { double :bike }
  let(:bike2) { double :bike}
  let(:bike3) { double :bike }

  it "should populate the garage's storage unit" do
    station.dock_bike(bike)
    station.dock_bike(bike2)
    station.dock_bike(bike3)
    allow(bike).to receive(:working?).and_return false
    allow(bike2).to receive(:working?).and_return false
    allow(bike3).to receive(:working?).and_return false
    van.get_bikes(station)
    van.unload_bikes(subject)
    expect(subject.storage).to eq [bike, bike2, bike3]
  end

  it 'should fix the bikes in storage' do
    allow(bike).to receive(:working?).and_return false
    expect(bike).to receive(:fix).and_return true
    station.dock_bike(bike)
    van.get_bikes(station)
    van.unload_bikes(subject)
    subject.fix_bikes
    allow(bike).to receive(:working?).and_return true
    expect(subject.storage[0].working?).to eq true
  end
end
