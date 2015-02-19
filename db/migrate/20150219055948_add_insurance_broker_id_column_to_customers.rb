class AddInsuranceBrokerIdColumnToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :insurance_broker_id, :integer
  end
end
