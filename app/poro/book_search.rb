class BookSearch
  attr_reader :quantity,
              :books,
              :id

  def initialize(quantity, books)
    @quantity = quantity
    @books = books
    @id = nil 
  end
end
