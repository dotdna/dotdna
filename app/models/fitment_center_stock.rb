class FitmentCenterStock < ActiveRecord::Base
  attr_accessible :fitment_center_id, :product_id, :qty
  belongs_to :fitment_center
  belongs_to :product

  validates :product_id, uniqueness: { scope: :fitment_center_id,
                                 message: "Cannot create muliple stock for Fitment Center" }

  def product_name
    return self.product.name
  end

end
