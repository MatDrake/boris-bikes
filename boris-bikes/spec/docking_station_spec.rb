require 'docking_station'

RSpec.describe DockingStation do

  it { expect respond_to(:release_bike) }


  # it 'return an instance of Bike' do
  #   subject.dock Bike.new
  #   expect(subject.release_bike).to be_a(Bike)
	# end

	it 'expects bike to respond to working?' do
		expect(Bike.new.working?).to eq(true)
	end

  it 'responds to dock' do
    expect(subject.dock Bike.new)
  end

  it 'sees a docked bike' do
    subject.dock Bike.new
    expect(subject.bikes)
  end

  it { is_expected.to respond_to(:dock).with(2).argument }

  it 'returns docked_bikes' do
    expect(subject.instance_variable_get(:@bikes)).to eql(subject.dock Bike.new)
    # print "#{@bike}"
    # print " -->"
    # print "#{docking.dock(bikes)}"
  end

  it 'returns error' do
    expect { subject.release_bike }.to raise_error('No bikes available')
  end

  it 'does not accept bike being docked if a bike is already docked' do
    subject.capacity.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error('Docking station full')
  end
  context "when a default is specified" do
   it 'uses that default' do
    capacity = 20
    docking_station = DockingStation.new(capacity)
    expect(docking_station.capacity).to eq capacity
  end
end
  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'bikes are working as default' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq([[bike, true]])
  end

  it 'can declare bikes broken' do
    bike = Bike.new
    subject.dock(bike, false)
    expect(subject.bikes).to eq([[bike, false]])
  end


end
