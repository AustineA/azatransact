class Transaction < ApplicationRecord
  belongs_to :user
  validates_presence_of :input_amount, :input_currency, :output_currency
  validates_numericality_of :input_amount, greater_than: 0
  validates :payload_id, uniqueness: true, presence: true
end
