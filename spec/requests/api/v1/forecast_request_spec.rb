require 'rails_helper'

describe 'Forecast API' do
  it 'can aggregate and send a forecast', :vcr do
    location = "Denver,CO"

    get "/api/v1/forecast?location=#{location}"

    confirmation = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(confirmation[:data]).to have_key(:id)
    expect(confirmation[:data]).to have_key(:type)
    expect(confirmation[:data]).to have_key(:attributes)
    expect(confirmation[:data][:attributes]).to have_key(:current_weather)
    expect(confirmation[:data][:attributes]).to have_key(:daily_weather)
    expect(confirmation[:data][:attributes]).to have_key(:hourly_weather)
    expect(confirmation[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(confirmation[:data][:attributes][:daily_weather][0]).to have_key(:date)
    expect(confirmation[:data][:attributes][:hourly_weather][0]).to have_key(:time)

  end
end
