class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :qty
      t.decimal :line_total

      t.timestamps
    end
  end
end
