require 'rails_helper'

describe OpenlibraryService do
  it 'can retreive books by location' do

    location = "Denver,CO"

    response = OpenlibraryService.location_search(location)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:numFound)
    expect(response[:numFound]).to be_a(Integer)
    expect(response[:numFound]).not_to eq(0)

    expect(response).to have_key(:docs)
    expect(response[:docs][0]).to have_key(:isbn)
    expect(response[:docs][0]).to have_key(:title)
    expect(response[:docs][0]).to have_key(:publisher)



  end
end
