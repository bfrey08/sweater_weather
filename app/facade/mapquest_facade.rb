class MapquestFacade

  def self.coordinates(location)
    results = MapquestService.coordinates(location)
    latLng = results[:results][0][:locations][0][:latLng]
    Coordinates.new(latLng)
  end

end
