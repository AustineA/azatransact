class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.string :user_id
      t.decimal :input_amount, default: 0, precision: 9, scale: 2
      t.string :input_currency, null: false, default: "NGN"
      t.decimal :output_amount, default: 0, precision: 9, scale: 2
      t.string :output_currency, null: false, default: "USD"

      t.timestamps
    end
    add_index :transactions, :user_id
  end
end