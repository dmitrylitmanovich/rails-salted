class CreateTransactions < ActiveRecord::Migration[7.1]
  def self.up
    create_table :transactions do |t|
      t.belongs_to :connection

      t.json :data

      t.timestamps
    end
  end
  
  def down
    drop_table :transactions
  end
end
