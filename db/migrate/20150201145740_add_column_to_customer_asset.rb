class AddColumnToCustomerAsset < ActiveRecord::Migration
  def change
    add_column :customer_assets, :fitment_center_stock_id, :integer
  end
end
