class CreateTransactions < ActiveRecord::Migration[7.1]
  def self.up
    create_table :transactions do |t|
      t.belongs_to :account

      t.integer    :transaction_id
      t.integer    :transaction_status
      t.string     :currency
      t.float      :amount, precision: 15, scale: 10
      t.string     :description
      t.string     :category
      t.string     :mode
      t.json       :extra

      t.timestamps
    end
  end
  
  def down
    drop_table :transactions
  end
end
