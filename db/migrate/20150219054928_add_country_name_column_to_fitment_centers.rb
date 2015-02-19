class AddCountryNameColumnToFitmentCenters < ActiveRecord::Migration
  def change
    add_column :fitment_centers, :country_name, :string
  end
end
