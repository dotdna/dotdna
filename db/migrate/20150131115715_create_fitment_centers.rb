class CreateFitmentCenters < ActiveRecord::Migration
  def change
    create_table :fitment_centers do |t|
      t.string :company_name
      t.string :tel_number
      t.string :fax_number
      t.text :physical_address
      t.string :contact_name
      t.string :contact_email_address
      t.string :contact_cell_number
      t.string :postal_address
      t.integer :registered_by
      t.boolean :verified

      t.timestamps
    end
  end
end
