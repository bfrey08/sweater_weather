class BookSearch
  attr_reader :destination,
              :forecast,
              :total_books_found,
              :books,
              :id

  def initialize(quantity, books, location, forecast)
    @destination = location
    @forecast = forecast
    @total_books_found = quantity
    @books = books
    @id = nil
  end
end
