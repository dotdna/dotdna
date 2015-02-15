class FitmentCenterDashboardController < ApplicationController

  before_filter :authenticate_fitment_center_user!

  skip_before_filter :authenticate_admin_user!

  layout 'fitment_center_layout'

  def index



  end


end