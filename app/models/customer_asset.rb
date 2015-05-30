class CustomerAsset < ActiveRecord::Base
  attr_accessible :color, :customer_id, :make, :microdot_number, :model, :registration_number,
                  :vehicle_type, :vinnumber, :fitment_center_stock_id, :fitment_center_id,
                  :red_flag, :red_flag_confirmed, :red_flag_lat, :red_flag_long

  validates_uniqueness_of :vinnumber, :registration_number, :microdot_number
  validates_presence_of :make, :model, :vehicle_type, :vinnumber, :microdot_number

  belongs_to :customer


end
