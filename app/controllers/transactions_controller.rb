class TransactionsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def index
    @transactions = Transaction.all
  end
  
  def create
    begin
      ActiveRecord::Base.transaction do

        output_amount = CurrencyConverter.call(
          params[:transaction][:input_amount], 
          params[:transaction][:input_currency], 
          params[:transaction][:output_currency]
          )

        @transaction = current_user.transactions.create!(
            transaction_params.merge(
              output_amount: output_amount["result"]
            )
          )

        render :show, status: 200 

      end
    rescue StandardError => e

      render json: { errors: e }, status: 400

    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:input_amount, :input_currency, :output_amount, :output_currency)
  end
end
