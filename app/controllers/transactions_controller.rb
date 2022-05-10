class TransactionsController < ApplicationController
  before_action :authenticate_user

  def index
    @transactions = Transaction.all
  end
  
  def create
    @transaction = current_user.transactions.create!(transaction_params)
    
    if @transaction.save
      render :show, status: 200 
      return
    end

    render json: { errors: @transaction.errors.full_messages }, status: 422
  end

  private

  def transaction_params
    params.require(:transaction).permit(:input_amount, :input_currency, :output_amount, :output_currency)
  end
end
