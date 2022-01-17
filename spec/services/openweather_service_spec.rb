require 'rails_helper'

describe OpenweatherService do
  describe 'get forecast' do
    it 'can receive a forecast based on lattitude and longitude of a city', :vcr do

      denver_lat = 39.74
      denver_lon = 105.00

      response = OpenweatherService.forecast(denver_lat, denver_lon)

      expect(response).to be_a(Hash)
      expect(response).to have_key(:lat)
      expect(response).to have_key(:lon)
      expect(response).to have_key(:current)

      expect(response[:current]).to be_a(Hash)
      expect(response[:current]).to have_key(:dt)
      expect(response[:current]).to have_key(:sunrise)
      expect(response[:current]).to have_key(:sunset)
      expect(response[:current]).to have_key(:temp)
      expect(response[:current]).to have_key(:feels_like)
      expect(response[:current]).to have_key(:humidity)
      expect(response[:current]).to have_key(:uvi)
      expect(response[:current]).to have_key(:visibility)
      expect(response[:current]).to have_key(:weather)
      expect(response[:current][:weather][0]).to have_key(:description)
      expect(response[:current][:weather][0]).to have_key(:icon)

      expect(response[:daily][0]).to be_a(Hash)
      expect(response[:daily][0]).to have_key(:dt)
      expect(response[:daily][0]).to have_key(:sunrise)
      expect(response[:daily][0]).to have_key(:sunset)
      expect(response[:daily][0]).to have_key(:temp)
      expect(response[:daily][0][:temp]).to have_key(:max)
      expect(response[:daily][0][:temp]).to have_key(:min)
      expect(response[:daily][0][:weather][0]).to have_key(:description)
      expect(response[:daily][0][:weather][0]).to have_key(:icon)


      expect(response[:hourly][0]).to have_key(:dt)
      expect(response[:hourly][0]).to have_key(:temp)
      expect(response[:hourly][0]).to have_key(:weather)
      expect(response[:hourly][0][:weather][0]).to have_key(:description)
      expect(response[:hourly][0][:weather][0]).to have_key(:icon)
    end
  end
end
