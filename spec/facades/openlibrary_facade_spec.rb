require 'rails_helper'

  describe OpenlibraryFacade do
    before(:each) do
      @location = "Denver,CO"
      @quantity = 5
    end
    it 'can create an array of books', :vcr do
      response = OpenlibraryFacade.location_search(@location)

      expect(response).to be_an(Array)
      expect(response[0]).to be_an_instance_of(Book)
    end
    it 'can get number of books based on location search', :vcr do
      response = OpenlibraryFacade.location_search(@location)

      expect(response).to be_an(Integer)
      expect(response).not_to eq(0)
    end
    it 'can create a book_search object', :vcr do
      response = OpenlibraryFacade.location_search(@location, @quantity)

      expect(response).to be_an_instance_of(BookSearch)
      expect(response.books).to be_an(Array)
      expect(response.books[0]).to be_an_instance_of(Book)
    end
  end
