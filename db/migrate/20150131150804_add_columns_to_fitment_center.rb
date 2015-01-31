class AddColumnsToFitmentCenter < ActiveRecord::Migration
  def change
    add_column :fitment_centers, :region_name, :string
    add_column :fitment_centers, :lat, :string
    add_column :fitment_centers, :long, :string
  end
end
