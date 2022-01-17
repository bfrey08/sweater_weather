class Forecast
  attr_reader :current,
              :daily,
              :hourly

  def initialize(current_weather, daily_weather, hourly_weather)
    @current = current_weather
    @daily = daily_weather
    @hourly = hourly_weather
  end 

end
