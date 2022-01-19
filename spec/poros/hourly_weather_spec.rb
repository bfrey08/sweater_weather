require 'rails_helper'

describe HourlyWeather do
  it 'can give you the temp in farenheight', :vcr do
    forecast =
                        {dt: 'this is a time', temp: 300, weather:
                                                                [
                                                                  {description: "this is a weather description", icon: "this is a weather icon url"
                                                                  }
                                                                ]
                                                                  }
    hourly_weather = HourlyWeather.new(forecast)
    expect(hourly_weather).to be_an_instance_of(HourlyWeather)
    expect(hourly_weather.temperature_f).to eq("80 F")
  end
end
