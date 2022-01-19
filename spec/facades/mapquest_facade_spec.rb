require 'rails_helper'

describe MapquestFacade do
  it 'can return coordinates object of a location', :vcr do
    location = "Denver,CO"
    response = MapquestFacade.coordinates(location)
    expect(response).to be_an_instance_of(Coordinates)
    expect(response.lattitude).to be_a(Float)
    expect(response.longitude).to be_a(Float)
  end

  it 'can return a route object', :vcr do
    from_location = "Denver,CO"
    to_location = "Estes Park,CO"
    response = MapquestFacade.directions(from_location, to_location)
    expect(response).to be_an_instance_of(Route)
    expect(response.weather_at_eta).to be_a(Hash)
  end
end
