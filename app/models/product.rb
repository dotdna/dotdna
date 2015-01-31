class Product < ActiveRecord::Base
  attr_accessible :name, :price
  has_many :order_lines
  has_many :fitment_center_stocks
end
