class AppController < ApplicationController

  skip_before_filter :authenticate_fitment_center_user!

  skip_before_filter :authenticate_admin_user!

  layout "app"

  def dashboard
    # redirect_to "/app/verification"
  end

  def verification
    # @customer_verification = CustomerVerification.new
  end

  def login
    # @customer = CustomerVerification.find_by_customer_id(params[:customer_id]) rescue nil
    # if @customer.nil? == false
    #   redirect_to "/app/dashboard"
    # else
    #   redirect_to "/app/verification"
    # end
  end

  def profile


  end

  def redflag

  end

  def crime_alert

  end

end