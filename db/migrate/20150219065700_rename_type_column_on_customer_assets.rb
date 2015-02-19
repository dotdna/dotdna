class RenameTypeColumnOnCustomerAssets < ActiveRecord::Migration
  def up
    rename_column :customer_assets, :type, :vehicle_type
  end

  def down
  end
end
