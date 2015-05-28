class CreateCustomerVerifications < ActiveRecord::Migration
  def change
    create_table :customer_verifications do |t|
      t.string :cell_number
      t.date :verification_date
      t.string :verification_code
      t.boolean :verified
      t.integer :customer_id

      t.timestamps
    end
  end
end
