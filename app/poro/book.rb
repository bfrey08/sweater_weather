class Book
  attr_reader :isbn,
              :title,
              :publisher

  def initialize(data)
    @isbn = data[:isbn] if data[:isbn]
    @title = data[:title] if data[:title]
    @publisher = data[:publisher] if data[:publisher]
  end
end  
