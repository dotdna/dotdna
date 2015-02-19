class FitmentCenterDashboardController < ApplicationController

  skip_before_filter :authenticate_admin_user!

  before_filter :authenticate_fitment_center_user!

  layout 'fitment_center_layout'

  def index



  end

  def guarantee_documents


    respond_to do |format|
      format.html
    end


  end




end