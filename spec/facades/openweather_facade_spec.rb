require 'rails_helper'

describe OpenweatherFacade do
  describe 'forecasts' do
    before(:each) do
      @denver_lat = 39.74
      @denver_lon = 105.00
    end
    it 'can can create current_weather objects', :vcr do

      response = OpenweatherFacade.current_weather(@denver_lat, @denver_lon)
      expect(response).to be_an_instance_of(CurrentWeather)

    end

    it 'can create array of daily_weather objects', :vcr do

      response = OpenweatherFacade.daily_weather(@denver_lat, @denver_lon)
      expect(response).to be_a(Array)
      expect(response.count).to eq(5)
      expect(response[0]).to be_an_instance_of(DailyWeather)

    end
    it 'can create array of hourly_weather objects', :vcr do

      response = OpenweatherFacade.hourly_weather(@denver_lat, @denver_lon)
      expect(response).to be_a(Array)
      expect(response.count).to eq(8)
      expect(response[0]).to be_an_instance_of(HourlyWeather)

    end

    it 'create a forecast object with the 3 types of weather objects', :vcr do
      response = OpenweatherFacade.forecast(@denver_lat, @denver_lon)

      expect(response).to be_an_instance_of(Forecast)
      expect(response.hourly_weather[0]).to be_an_instance_of(HourlyWeather)
      expect(response.current_weather).to be_an_instance_of(CurrentWeather)
      expect(response.daily_weather[0]).to be_an_instance_of(DailyWeather)
    end

  end
end
