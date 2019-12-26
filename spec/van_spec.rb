require 'van'

describe Van do
  let(:bike) { double :bike }
  let(:station) { double :dockingstation }
  it 'should take all the broken bikes from the station' do
    bike = double(working?: false)
    allow(station).to receive(:dock_bike).with(bike)
    allow(station).to receive(:bikes).and_return([bike])
    expect(subject.get_bikes(station)).to eq [bike]
  end
end
