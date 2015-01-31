class Customer < ActiveRecord::Base
  attr_accessible :cell_number, :email, :first_name, :idnumber, :last_name, :middle_name, :physical_address, :title
  validates_presence_of :first_name, :last_name, :idnumber, :cell_number
  validates_uniqueness_of :idnumber, :cell_number

  has_one :customer_asset
end
