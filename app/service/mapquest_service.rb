class MapquestService

  def self.coordinates(location)
    response = url.get("?key=#{ENV['mapquest_key']}&location=#{location}")

    parse_response(response)
  end

  def self.url
    Faraday.new(url: "http://www.mapquestapi.com/geocoding/v1/address")
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end