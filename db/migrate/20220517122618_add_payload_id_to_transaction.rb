class AddPayloadIdToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :payload_id, :string
    add_index :transactions, :payload_id,  unique: true
  end
end
