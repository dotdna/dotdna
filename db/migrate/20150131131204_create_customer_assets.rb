class CreateCustomerAssets < ActiveRecord::Migration
  def change
    create_table :customer_assets do |t|
      t.integer :customer_id
      t.string :make
      t.string :model
      t.string :vinnumber
      t.string :color
      t.string :microdot_number
      t.string :registration_number
      t.integer :type

      t.timestamps
    end
    add_index :customer_assets, :customer_id
  end
end
