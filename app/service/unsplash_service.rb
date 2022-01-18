class UnsplashService

  def self.search_collection(location)
    response = url.get("/search/collections?client_id=#{ENV['unsplash_key']}&query=#{location}")
    parse_response(response)
  end

  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.url
    Faraday.new(url: "https://api.unsplash.com")
  end

end
