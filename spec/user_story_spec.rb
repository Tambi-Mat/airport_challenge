describe 'User Stories' do

  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport and confirm that it has landed
  it 'instructs plane to land at an airport' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false # stub method :stormy? to set airport SUNNY (NOT STORMY)
    expect { airport.land_plane(plane) }.not_to raise_error
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy
  it 'prevents landing when weather is stormy' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true # stub method :stormy? to set airport stormy
    expect { airport.land_plane(plane) }.to raise_error 'Weather stormy. Plane can not land!'
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and
  # confirm that it is no longer in the airport
  it 'instructs plane to take off' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false # stub method :stormy? to set airport SUNNY (NOT STORMY)
    expect { airport.take_off(plane) }.not_to raise_error
  end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy
  it 'prevents take-off when weather is stormy' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true # stub method :stormy? to set airport stormy
    expect { airport.take_off(plane) }.to raise_error 'Weather stormy. Plane can not take-off!'
  end
end
