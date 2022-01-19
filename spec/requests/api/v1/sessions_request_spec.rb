require 'rails_helper'

describe 'Sessions API' do
  describe 'happy_path' do
    it 'can validate a succesful user login attempt', :vcr do
      user = {email: "bfrey16@gmail.com",
              password: "test1234"}
      @user = User.new(email: user[:email])
      @user.password = user[:password]
      @user.save!
      post "/api/v1/sessions", params: user
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
    it 'can give an error message when a user gives wrong password', :vcr do
      user = {email: "bfrey16@gmail.com",
              password: "test124"}
      user_check = {email: "bfrey16@gmail.com",
                    password: "wrong_password"}
      @user = User.new(email: user[:email])
      @user.password = user[:password]
      @user.save!
      post "/api/v1/sessions", params: user_check
      confirmation = JSON.parse(response.body, symbolize_names: true)
      expect(response).not_to be_successful
      expect(response.status).to eq(400)
      expect(confirmation).to have_key(:errors)
    end
  end
end
