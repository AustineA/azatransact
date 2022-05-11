require 'rails_helper'

RSpec.describe "Transactions", type: :request do
  
  let(:transaction_params) { { "input_amount" => 5000, "input_currency" => "USD", "output_currency" => "NGN"} }
  let(:user) { User.create!(password: "123456", email: "kalel.amah@gmail.com")}
  let(:token){ TokenGenerator.call( {sub: user.id} ) }

  subject { 
    Transaction.create(transaction_params.merge( user: user)) 
  }


  describe "GET /index" do
    before do
      Transaction.create(transaction_params.merge( user: user)) 
    end

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
    end
  end

  describe "GET /show" do
    it "responds with a transaction" do
      get "/transactions/#{subject.id}"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("input_amount")
    end
  end

end
