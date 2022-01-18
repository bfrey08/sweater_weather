class OpenweatherService

  def self.forecast(lat, lon)
    Rails.cache.fetch('pull_open_weath', :expires => 1.hour) do
      response = url.get("?lat=#{lat}&lon=#{lon}&exclude=minutely&appid=#{ENV['openweather_key']}")
      parse_response(response)
    end
  end

  def self.url
    Faraday.new(url: "https://api.openweathermap.org/data/2.5/onecall")
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
