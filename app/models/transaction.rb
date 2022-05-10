class Transaction < ApplicationRecord
  belongs_to :user
  validates_presence_of :input_amount, :input_currency, :output_amount, :output_currency
end
