class OpenlibraryFacade

  def self.books(location)
    results = OpenlibraryService.location_search(location)
    book_data = results[:docs]
    book_data.map do |book|
      Book.new(book)
    end
  end

  def self.quantity(location)
    results = OpenlibraryService.location_search(location)
    results[:numFound]
  end

  def self.book_search(location, quantity)
    BookSearch.new(quantity(location), books(location)[0..(quantity - 1)])
  end

end
