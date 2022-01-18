class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(forecast)

    @datetime = forecast[:dt]
    @sunrise = forecast[:sunrise]
    @sunset = forecast[:sunset]
    @temperature  = forecast[:temp]
    @feels_like = forecast[:feels_like]
    @humidity = forecast[:humidity]
    @uvi = forecast[:uvi]
    @visibility = forecast[:visibility]
    @conditions = forecast[:weather][0][:description]
    @icon = forecast[:weather][0][:icon]

  end

  def temperature_f
    ((@temperature - 273.15) * (9/5) + 32).round(0).to_s.concat(" F")
  end

end
