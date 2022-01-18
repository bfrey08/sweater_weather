class UnsplashFacade
  def self.picture(location)
    collection = UnsplashService.search_collection(location)
    photo = collection[:results][0][:cover_photo]

    Picture.new(photo, location)
  end
end
