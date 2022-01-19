class MapquestFacade

  def self.coordinates(location)
    results = MapquestService.coordinates(location)
    latLng = results[:results][0][:locations][0][:latLng]
    Coordinates.new(latLng)
  end

  def self.directions(from_location, to_location)
    results = MapquestService.directions(from_location, to_location)
    hours = ((results[:route][:realTime] / 60) / 60).round(0)
    time = results[:route][:realTime]
    lat = coordinates(to_location).lattitude
    lon = coordinates(to_location).longitude
    weather_info = OpenweatherFacade.hourly_weather(lat, lon)
    weather_at_eta = weather_info[hours]
    Route.new(from_location, to_location, time, weather_at_eta)
end
