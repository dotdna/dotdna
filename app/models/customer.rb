class Customer < ActiveRecord::Base
  attr_accessible :cell_number, :email, :first_name, :idnumber, :last_name, :middle_name,
                  :physical_address, :title, :fitment_centre_id, :customer_assets_attributes,
                  :insurance_broker_id, :guarantee_number, :policy_renewal_date

  validates_presence_of :first_name, :last_name, :idnumber, :cell_number
  validates_uniqueness_of :idnumber, :cell_number, :guarantee_number

  has_many :customer_assets
  has_one :customer_verification
  belongs_to :fitment_center
  belongs_to :insurance_broker

  has_many :customer_feedbacks

  accepts_nested_attributes_for :customer_assets, allow_destroy: true, :reject_if => :all_blank

end
