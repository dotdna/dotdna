class AddRedFlagColumnToCustomerAssets < ActiveRecord::Migration
  def change
    add_column :customer_assets, :red_flag, :boolean
    add_column :customer_assets, :red_flag_lat, :decimal
    add_column :customer_assets, :red_flag_long, :decimal
    add_column :customer_assets, :red_flag_confirmed, :boolean
  end
end
