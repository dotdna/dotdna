class AddColumnsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :fitment_centre_id, :integer
  end
end
