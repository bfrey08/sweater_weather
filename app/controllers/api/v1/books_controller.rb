class Api::V1::BooksController < ApplicationController

  def index
    book_search = OpenlibraryFacade.book_search(params[:location], params[:quantity])
    render json: BooksSerializer.new(book_search)
  end

end
