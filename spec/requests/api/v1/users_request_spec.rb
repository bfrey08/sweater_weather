require 'rails_helper'

describe 'Users API' do
  describe 'happy_path' do
    it 'can take in user info, create a user, and send confirmation', :vcr do
      user = {email: "bfrey16@gmail.com",
              password: "test1234",
              password_confirmation: "test1234"}
      headers = {'CONTENT_TYPE' => 'application/json'}

      post "/api/v1/users", headers: headers, params: user.to_json

      confirmation = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(confirmation).to be_a(Hash)
      expect(confirmation).to have_key(:data)
      expect(confirmation[:data]).to have_key(:id)
      expect(confirmation[:data]).to have_key(:type)
      expect(confirmation[:data]).to have_key(:attributes)
      expect(confirmation[:data][:attributes]).to have_key(:email)
      expect(confirmation[:data][:attributes]).to have_key(:api_key)

    end
  end
  describe 'sad_path' do
    it 'can give error when creating a new user bc email already exists', :vcr do
      user = {email: "bfrey16@gmail.com",
              password: "test1234",
              password_confirmation: "test1234"}
      @user = User.new(email: user[:email])
      @user.password = user[:password]
      @user.save!
      user1 = {email: "bfrey16@gmail.com",
               password: "test1234",
               password_confirmation: "test1234"}
      headers = {'CONTENT_TYPE' => 'application/json'}

      post "/api/v1/users", headers: headers, params: user1.to_json
      confirmation = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(confirmation).to have_key(:errors)

    end
    it 'can give error when creating a new user bc passwords no match' do
      user1 = {email: "bfrey16@gmail.com",
               password: "test1234",
               password_confirmation: "test123"}
      headers = {'CONTENT_TYPE' => 'application/json'}

      post "/api/v1/users", headers: headers, params: user1.to_json
      confirmation = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(confirmation).to have_key(:errors)

    end
  end

end
