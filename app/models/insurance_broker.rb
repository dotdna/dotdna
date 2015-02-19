class InsuranceBroker < ActiveRecord::Base
  attr_accessible :contact_email, :contact_mobile, :contact_name, :country_name, :fax_number, :name,
                  :physical_address, :tel_number

  has_many :customers
end
