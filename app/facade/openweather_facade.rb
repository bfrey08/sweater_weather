class OpenweatherFacade

  def self.current_weather(lat, lon)
    response = service(lat, lon)
    current_forecast = response[:current]

    CurrentWeather.new(current_forecast)
  end

  def self.daily_weather(lat, lon)
    response = service(lat, lon)
    daily_forecast = response[:daily]

    daily_forecast[0..4].map do |day|
      DailyWeather.new(day)
    end
  end

  def self.hourly_weather(lat, lon)
    response = service(lat, lon)
    hourly_forecast = response[:hourly]

    hourly_forecast[0..7].map do |hour|
      HourlyWeather.new(hour)
    end
  end

  def self.forecast(lat, lon)
    Forecast.new(current_weather, daily_weather, hourly_weather)
  end

  def self.service(lat, lon)
    OpenweatherService.forecast(lat, lon)

  end

end
