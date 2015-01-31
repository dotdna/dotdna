class CreateFitmentCenterStocks < ActiveRecord::Migration
  def change
    create_table :fitment_center_stocks do |t|
      t.integer :fitment_center_id
      t.integer :product_id
      t.integer :qty

      t.timestamps
    end
  end
end
