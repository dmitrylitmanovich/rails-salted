class CreateAccounts < ActiveRecord::Migration[7.1]
  def self.up
    create_table :accounts do |t|
      t.belongs_to :connection

      t.integer    :account_id
      t.string     :name
      t.string     :currency
      t.float      :balance, precision: 15, scale: 10
      t.string     :nature
      t.json       :extra

      t.timestamps
    end
  end
  
  def down
    drop_table :accounts
  end
end
