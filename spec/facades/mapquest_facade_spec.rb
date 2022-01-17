require 'rails_helper'

describe MapquestFacade do
  it 'can return coordinates object of a location', :vcr do
    location = "Denver,CO"
    response = MapquestFacade.coordinates(location)
    expect(response).to be_an_instance_of(Coordinates)
    expect(response.lattitude).to be_a(Float)
    expect(response.longitude).to be_a(Float)
  end
end
