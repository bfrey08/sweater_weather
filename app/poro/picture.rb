class Picture
  attr_reader :location,
              :image_url,
              :source,
              :author,
              :author_url,
              :id

  def initialize(picture, location)

    @location = location
    @image_url = picture[:urls][:regular]
    @source = "Unsplash"
    @author = picture[:user][:name]
    @author_url = picture[:user][:links][:portfolio]
    @id = nil
  end

end
