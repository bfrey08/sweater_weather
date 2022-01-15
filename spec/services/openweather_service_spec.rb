require 'rails_helper'

describe OpenweatherService do
  describe 'get forecast' do
    it 'can receive a forecast based on lattitude and longitude of a city' do

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
      expect(response[:current]).to have_key(:hummidity)
      expect(response[:current]).to have_key(:uvi)
      expect(response[:current]).to have_key(:visibility)
      expect(response[:current]).to have_key(:weather)
      expect(response[:current][:weather]).to have_key(:description)
      expect(response[:current][:weather]).to have_key(:icon)

      expect(response[:daily]).to be_a(Hash)
      expect(response[:daily]).dailyto have_key(:dt)
      expect(response[:daily]).to have_key(:sunrise)
      expect(response[:daily]).to have_key(:sunset)
      expect(response[:daily]).to have_key(:temp)
      expect(response[:daily][:temp]).to have_key(:max)
      expect(response[:daily][:temp]).to have_key(:min)
      expect(response[:daily][:weather]).to have_key(:description)
      expect(response[:daily][:weather]).to have_key(:icon)


      expect(response[:hourly]).to have_key(:dt)
      expect(response[:hourly]).to have_key(:temp)
      expect(response[:hourly]).to have_key(:weather)
      expect(response[:hourly][:weather]).to have_key(:description)
      expect(response[:hourly][:weather]).to have_key(:icon)
    end
end
