require 'rails_helper'

describe 'road_trip API' do
  describe 'happy_path' do
    it 'can take in to and from locations and make a road_trip', :vcr do
      from_location = "Denver,CO"
      to_location = "Estes Park,CO"

      headers = {'CONTENT_TYPE' => 'application/json'}
      user = {email: "bfrey16@gmail.com",
              password: "test1234",
              password_confirmation: "test1234"}

      post "/api/v1/users", headers: headers, params: user.to_json
      confirmation = JSON.parse(response.body, symbolize_names: true)
      api_key = confirmation[:data][:attributes][:api_key]

      route_request = {origin: from_location,
                       destination: to_location,
                       api_key: api_key
                       }

      post "/api/v1/road_trip", headers: headers, params: route_request.to_json

      confirmation1 = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(confirmation1).to be_a(Hash)
      expect(confirmation1).to have_key(:data)
      expect(confirmation1[:data]).to have_key(:id)
      expect(confirmation1[:data]).to have_key(:type)
      expect(confirmation1[:data]).to have_key(:attributes)
      expect(confirmation1[:data][:attributes]).to have_key(:start_city)
      expect(confirmation1[:data][:attributes]).to have_key(:end_city)
      expect(confirmation1[:data][:attributes]).to have_key(:travel_time)
      expect(confirmation1[:data][:attributes]).to have_key(:weather_at_eta)
      expect(confirmation1[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(confirmation1[:data][:attributes][:weather_at_eta]).to have_key(:conditions)


    end
  end
  describe 'sad_path' do
    it 'errors out when a valid api key is not given', :vcr do
      from_location = "Denver,CO"
      to_location = "Estes Park,CO"
      headers = {'CONTENT_TYPE' => 'application/json'}
      api_key = "bad_api_key"

      route_request = {origin: from_location,
                       destination: to_location,
                       api_key: api_key
                       }
     post "/api/v1/road_trip", headers: headers, params: route_request.to_json

     confirmation1 = JSON.parse(response.body, symbolize_names: true)

     expect(response.status).to eq(401)
     expect(confirmation1).to have_key(:errors)

    end
  end
end
