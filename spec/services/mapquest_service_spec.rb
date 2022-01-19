require 'rails_helper'

describe MapquestService do
  it 'can return the location', :vcr do
    location = "Denver,CO"

    response = MapquestService.coordinates(location)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results][0]).to have_key(:locations)
    expect(response[:results][0][:locations][0]).to have_key(:latLng)
    expect(response[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(response[:results][0][:locations][0][:latLng]).to have_key(:lng)
  end

  it 'can return directions', :vcr do
    from_location = "Denver,CO"
    to_location = "Estes Park,CO"
    response = MapquestService.directions(from_location, to_location)
    expect(response).to be_a(Hash)
    expect(response).to have_key(:route)
    expect(response[:route]).to have_key(:realTime)


  end

end
