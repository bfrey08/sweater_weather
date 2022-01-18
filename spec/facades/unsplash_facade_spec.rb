require 'rails_helper'

describe UnsplashFacade do
  it 'can return a picture of a location', :vcr do
    location = "Denver,CO"
    response = UnsplashFacade.picture(location)

    expect(response).to be_an_instance_of(Picture)
    expect(response.location).to eq(location)
    expect(response.image_url).to be_a(String)
    expect(response.source).to eq("Unsplash")
    expect(response.author).to be_a(String)
    expect(response.author_url).to be_a(String)
  end

end
