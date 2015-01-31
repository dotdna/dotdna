class FitmentCenterUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :fitment_center_id, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  belongs_to :fitment_center
end
