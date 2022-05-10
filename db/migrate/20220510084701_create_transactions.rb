class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.string :user_id
      t.bigint :input_amount, default: 0
      t.string :input_currency, null: false, default: "NGN"
      t.bigint :output_amount, default: 0
      t.string :output_currency, null: false, default: "USD"

      t.timestamps
    end
    add_index :transactions, :user_id
  end
end
