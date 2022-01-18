class BooksSerializer
  include JSONAPI::Serializer
  attributes :quantity, :books
end
