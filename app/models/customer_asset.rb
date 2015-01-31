class CustomerAsset < ActiveRecord::Base
  attr_accessible :color, :customer_id, :make, :microdot_number, :model, :registration_number, :type, :vinnumber
  validates_uniqueness_of :vinnumber, :registration_number, :microdot_number
  validates_presence_of :make, :model, :type, :vinnumber, :microdot_number
end
