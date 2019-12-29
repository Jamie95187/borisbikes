require 'garage'
require 'support/shared_examples_for_bike_container'

describe Garage do
  it_behaves_like BikeContainer

  let(:station) { double :station }
  let(:van) { Van.new }
  let(:bike) { double :bike }
  let(:bike2) { double :bike }
  let(:bike3) { double :bike }

  it "should populate the garage's storage unit" do
    bike = double :bike, working?: false
    allow(station).to receive(:broken_bikes).and_return [bike]
    allow(station).to receive(:get_broken_bike).and_return bike
    van.load(station)
    expect(subject.add_bike bike).to eq [bike]
  end

  it 'should fix the bikes in storage' do
    allow(bike).to receive(:working?).and_return false
    expect(bike).to receive(:fix).and_return true
    subject.add_bike bike
    subject.fix_bikes
    allow(bike).to receive(:working?).and_return true
    expect(subject.empty?).to be_falsey
  end

end
