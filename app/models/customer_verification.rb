class CustomerVerification < ActiveRecord::Base
  attr_accessible :cell_number, :verification_code, :verification_date, :verified, :customer_id
  belongs_to :customer
end
