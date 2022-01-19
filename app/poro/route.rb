class Route
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta
  def initialize(from_location, to_location, time, weather_info)
    @id = nil
    @start_city = from_location
    @end_city = to_location
    @travel_time = hours_minutes(time)
    @weather_at_eta = {temperature: weather_info.temperature,
                      conditions: weather_info.conditions}
  end
  def hours_minutes(time)
    hours = ((time / 60) / 60).round(0)
    minutes = ((time / 60) % 60).round(0)
    "#{hours} hours, #{minutes} minutes"
  end

end
