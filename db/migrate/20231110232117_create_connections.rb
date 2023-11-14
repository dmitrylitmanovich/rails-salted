class CreateConnections < ActiveRecord::Migration[7.1]
  def change
    create_table :connections do |t|
      t.json :data
      t.datetime :last_success_at
      t.datetime :next_refresh_possible_at
      t.integer :provider_id
      t.string :provider_code
      t.string :provider_name
      t.integer :status
      t.boolean :store_credentials

      t.timestamps
    end
  end
end
