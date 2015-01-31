class FitmentCenter < ActiveRecord::Base
  attr_accessible :company_name, :contact_cell_number, :contact_email_address,
                  :contact_name, :fax_number, :physical_address, :postal_address, :registered_by,
                  :tel_number, :verified


  has_many :fitment_center_users
end
