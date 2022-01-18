class OpenlibraryService

  def self.location_search(location)
    Rails.cache.fetch('pull_open_lib', :expires => 1.hour) do
      response = url.get("?place=#{location}")
      parse_response(response)
    end
  end

  def self.url
    Faraday.new(url: "http://openlibrary.org/search.json")
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
