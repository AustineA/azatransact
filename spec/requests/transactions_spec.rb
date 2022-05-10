require 'rails_helper'

RSpec.describe "Transactions", type: :request do

  user = User.create!(
    password: "123456", 
    email: "kalel.amah@gmail.com"
  )

  token = TokenGenerator.call( {sub: user.id} )


  before do

    Transaction.create(
      user: user,
      input_amount: 5000*100,
      input_currency: "NGN",
      output_amount: 12*100,
      output_currency: "USD"
    ) 
  end

  
  describe "GET /index" do
    it "responds with all transactions" do
      get "/transactions", headers: { "Authorization": "Bearer #{token}" }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("input_amount")
    end
  end
end
