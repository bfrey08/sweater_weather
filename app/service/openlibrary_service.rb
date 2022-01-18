class OpenlibraryService

  def self.location_search(location)
    response = url.get("?palce=#{location}")
    parse_response(response)
  end

  def self.url
    Faraday.new(url: "http://openlibrary.org/search.json")
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
