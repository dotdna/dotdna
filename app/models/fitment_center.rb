class FitmentCenter < ActiveRecord::Base
  attr_accessible :company_name, :contact_cell_number, :contact_email_address,
                  :contact_name, :fax_number, :physical_address, :postal_address, :registered_by,
                  :tel_number, :verified, :region_name, :lat, :long


  has_many :fitment_center_users
  has_many :orders
  has_many :fitment_center_stocks
  has_many :customers
end
