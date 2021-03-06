class TransactionsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  before_action :set_transaction, only: [:show]

  def index
    @transactions = Transaction.all
  end
  
  def create
    begin
      ActiveRecord::Base.transaction do   

        output_amount = CurrencyConverter.call( 
          transaction_params[:input_amount], 
          transaction_params[:input_currency], 
          transaction_params[:output_currency]
        ) unless transaction_params[:output_amount].present?   
        
        derived_params = transaction_params
        derived_params[:output_amount] = output_amount if output_amount

        @transaction = current_user.transactions.create!( derived_params )
        render :show, status: 200
      end
    rescue StandardError => e
      render json: { errors: e }, status: 400
    end
  end

  def show; end

  private

 
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:input_amount, :input_currency, :output_amount, :output_currency, :payload_id)
  end

end
