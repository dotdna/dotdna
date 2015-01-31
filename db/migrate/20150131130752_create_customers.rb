class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :cell_number
      t.text :physical_address
      t.string :email
      t.string :idnumber

      t.timestamps
    end
  end
end
