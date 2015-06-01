class CustomerFeedback < ActiveRecord::Base
  attr_accessible :body, :customer_id, :subject, :viewed
  belongs_to :customer
end
