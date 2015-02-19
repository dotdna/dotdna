class AddGuaranteeNumberColumnToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :guarantee_number, :string
  end
end
