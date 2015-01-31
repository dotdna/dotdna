class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :fitment_center_id
      t.decimal :total
      t.boolean :dispatched
      t.string :ref_number

      t.timestamps
    end
    add_index :orders, :fitment_center_id
  end
end
