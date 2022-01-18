class Forecast
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather,
              :id

  def initialize(current_weather, daily_weather, hourly_weather)
    @current_weather = current_weather
    @daily_weather = daily_weather
    @hourly_weather = hourly_weather
    @id = nil
  end

  def forecast_light
            {summary: @current_weather.conditions,
             temperature: @current_weather.temperature_f
            }
  end
end
