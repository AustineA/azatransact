require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  let(:transaction_params) { { "input_amount" => 5000*100, "input_currency" => "NGN", "output_amount" => 12*100, "output_currency" => "USD"} }

  user = User.create!(
    password: "123456", 
    email: "kalel.amah@gmail.com"
  )

  token = TokenGenerator.call( {sub: user.id} )

  before do
    Transaction.create(transaction_params.merge( user: user)) 
  end

  
  describe "GET /index" do
    it "responds with all transactions" do
      get "/transactions", headers: { "Authorization": "Bearer #{token}" }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("input_amount")
    end
  end

  describe "POST /create" do
    it "creates a transaction and returns JSON" do 
      post "/transactions", params: { transaction: transaction_params }, headers: { "Authorization": "Bearer #{token}" }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("input_amount")

      puts response.body
    end
  end

end
