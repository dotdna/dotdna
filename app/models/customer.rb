class Customer < ActiveRecord::Base
  attr_accessible :cell_number, :email, :first_name, :idnumber, :last_name, :middle_name, :physical_address, :title, :fitment_centre_id, :customer_asset_attributes
  validates_presence_of :first_name, :last_name, :idnumber, :cell_number
  validates_uniqueness_of :idnumber, :cell_number

  has_many :customer_assets
  belongs_to :fitment_center

  accepts_nested_attributes_for :customer_assets, allow_destroy: true, :reject_if => :all_blank
end