class Order < ActiveRecord::Base
  attr_accessible :dispatched, :fitment_center_id, :ref_number, :total, :order_lines_attributes
  belongs_to :fitment_center
  has_many :order_lines
  accepts_nested_attributes_for :order_lines, allow_destroy: true, :reject_if => :all_blank

  def calculate_total

    total = 0.0

    self.order_lines.each do |x|

      total += x.line_total

    end

  end
end
