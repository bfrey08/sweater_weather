require 'rails_helper'

describe UnsplashService do
  describe 'collections' do
    it 'can search a collection and retreive an image', :vcr do

      location = "Denver,CO"

      response = UnsplashService.search_collection(location)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:results)
      expect(response[:results][0]).to have_key(:cover_photo)
      expect(response[:results][0][:cover_photo]).to have_key(:urls)

    end
  end
end
