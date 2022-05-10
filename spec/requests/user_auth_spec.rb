require 'rails_helper'

RSpec.describe "Authentication", type: :request do

  before do
    User.create(
      password: "123456", 
      email: "austine.amah@gmail.com", 
      first_name: "Austine", 
      last_name: "Amah"
    )
  end

  describe "Post /user_token" do

    it "responds with JWT" do
      post "/user_token", params:{ auth: { email: "austine.amah@gmail.com", password: "123456"}}
      expect(response).to have_http_status(:created)
      expect(response.body).to include("jwt", "user")
      # puts response.body
    end

  end

end
