class CreateCustomers < ActiveRecord::Migration[7.1]
  def self.up
    create_table :customers do |t|
      t.belongs_to :user
      t.string :customer_id
      t.string :identifier

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
