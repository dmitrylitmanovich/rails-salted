class CreateAccounts < ActiveRecord::Migration[7.1]
  def self.up
    create_table :accounts do |t|
      t.belongs_to :connection

      t.json :data

      t.timestamps
    end
  end
  
  def down
    drop_table :accounts
  end
end
