class OrderLine < ActiveRecord::Base
  attr_accessible :line_total, :order_id, :product_id, :qty
  belongs_to :order
  belongs_to :product

  after_create :calculate_line_total

  def calculate_line_total
    self.line_total = self.product.price * self.qty
    self.save!
  end

end
