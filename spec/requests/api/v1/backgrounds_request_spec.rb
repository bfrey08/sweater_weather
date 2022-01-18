require 'rails_helper'

describe 'Picture API' do
  it 'can find and send a picture of a location', :vcr do
    location = "Denver,CO"

    get "/api/v1/backgrounds?location=#{location}"

    confirmation = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(confirmation[:data]).to have_key(:id)
    expect(confirmation[:data]).to have_key(:type)
    expect(confirmation[:data]).to have_key(:attributes)
    expect(confirmation[:data][:attributes]).to have_key(:location)
    expect(confirmation[:data][:attributes]).to have_key(:image_url)
    expect(confirmation[:data][:attributes]).to have_key(:source)
    expect(confirmation[:data][:attributes]).to have_key(:author)
    expect(confirmation[:data][:attributes]).to have_key(:author_url)

  end
end
