require 'rails_helper'

describe MapquestService do
  it 'can return the lat/long' do
    VCR.use_cassette("mapquest_denver,CO") do
    location = "Denver,CO"

    response = MapquestService.coordinates(location)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results][0]).to have_key(:locations)
    expect(response[:results][0][:locations][0]).to have_key(:latLng)
    expect(response[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(response[:results][0][:locations][0][:latLng]).to have_key(:lng)
    end
  end

end
