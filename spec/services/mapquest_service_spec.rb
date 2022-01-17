require 'rails_helper'

describe MapquestService do
  it 'can return the lat/long' do
    location = "Denver,CO"

    response = MapquestService.forecast(location)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to have_key(:latLng)
    expect(response[:results][:latLng]).to have_key(:lat)
    expect(response[:results][:latLng]).to have_key(:lng)

  end

end
