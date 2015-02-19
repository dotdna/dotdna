class CreateInsuranceBrokers < ActiveRecord::Migration
  def change
    create_table :insurance_brokers do |t|
      t.string :name
      t.text :physical_address
      t.string :tel_number
      t.string :fax_number
      t.string :contact_name
      t.string :contact_email
      t.string :contact_mobile
      t.string :country_name

      t.timestamps
    end
  end
end
