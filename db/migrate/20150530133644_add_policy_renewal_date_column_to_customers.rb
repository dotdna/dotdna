class AddPolicyRenewalDateColumnToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :policy_renewal_date, :date
  end
end
