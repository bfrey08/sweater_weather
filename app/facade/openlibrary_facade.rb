class OpenlibraryFacade

  def self.books(location)
    results = service(location)
    book_data = results[:docs]
    book_data.map do |book|
      Book.new(book)
    end
  end

  def self.quantity(location)
    results = service(location)
    results[:numFound]
  end

  def self.book_search(location, quantity)
    quantity = quantity.to_i
    coord = MapquestFacade.coordinates(location)
    forecast = OpenweatherFacade.forecast(coord.lattitude, coord.longitude)
    forecast_light = forecast.forecast_light
    BookSearch.new(quantity(location), books(location)[0..(quantity - 1)], location, forecast_light)
  end


  def self.service(location)

      OpenlibraryService.location_search(location)

  end

end
