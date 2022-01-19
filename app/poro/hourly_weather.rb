class HourlyWeather
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(forecast)
    @time = forecast[:dt]
    @temperature = forecast[:temp]
    @conditions = forecast[:weather][0][:description]
    @icon = forecast[:weather][0][:icon]
  end

  def temperature_f
    ((@temperature - 273.15) * (1.8) + 32).round(0).to_s.concat(" F")
  end


end
