class OpenweatherFacade

  def self.current_weather(lat, lon)
    forecast = forecast(lat, lon)
    current_forecast = forecast[:current]

    CurrentWeather.new(current_forecast)
  end

  def self.daily_weather(lat, lon)
    forecast = forecast(lat, lon)
    daily_forecast = forecast[:daily]

    daily_forecast[0..4].map do |day|
      DailyWeather.new(day)
    end
  end

  def self.hourly_weather(lat, lon)
    forecast = forecast(lat, lon)
    hourly_forecast = forecast[:hourly]

    hourly_forecast[0..7].map do |hour|
      HourlyWeather.new(hour)
    end
  end

  def self.forecast(lat, lon)
    OpenweatherService.forecast(lat, lon)

  end

end
