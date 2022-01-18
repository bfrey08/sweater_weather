require 'rails_helper'

describe 'Book-search API' do
  it 'can find and send books related to a location', :vcr do
    location = "Denver,CO"
    quantity = 5

    get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"
    confirmation = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(confirmation).to have_key(:data)
    expect(confirmation[:data]).to have_key(:id)
    expect(confirmation[:data]).to have_key(:type)
    expect(confirmation[:data]).to have_key(:attributes)
    expect(confirmation[:data][:attributes]).to have_key(:destination)
    expect(confirmation[:data][:attributes]).to have_key(:forecast)
    expect(confirmation[:data][:attributes][:forecast]).to have_key(:summary)
    expect(confirmation[:data][:attributes][:forecast]).to have_key(:temperature)

    expect(confirmation[:data][:attributes]).to have_key(:total_books_found)

    expect(confirmation[:data][:attributes]).to have_key(:books)

    expect(confirmation[:data][:attributes][:books]).to be_a(Array)
    expect(confirmation[:data][:attributes][:books].count).to be < (quantity)
    #expect(confirmation[:data][:attributes][:books][0]).to have_key(:isbn)
    expect(confirmation[:data][:attributes][:books][0]).to have_key(:title)
    expect(confirmation[:data][:attributes][:books][0]).to have_key(:publisher)

  end
end
