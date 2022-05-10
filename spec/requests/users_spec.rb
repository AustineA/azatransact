require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user_params) { {"email" => "austine.amah@gmail.com", "password" => "12345"} }

    it "#create a User" do
    post "/users", params: { user: user_params }
      expect(response).to have_http_status(:created)
      expect(response.body).to include("User created successfully")
    end

end
