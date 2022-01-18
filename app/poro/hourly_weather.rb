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


end
