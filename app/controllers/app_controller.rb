class AppController < ApplicationController

  skip_before_filter :authenticate_fitment_center_user!

  skip_before_filter :authenticate_admin_user!

  layout "app"

  def dashboard
    # redirect_to "/app/verification"
  end

  def validate

  end

  def validation_check
    @customer_verification = CustomerVerification.find_by_verification_code(params[:verification_code]) rescue nil
    if @customer_verification != nil

      session[:customer_id] = @customer_verification.customer_id
      @customer_verification.verified = true
      @customer_verification.save!
      redirect_to "/app/dashboard"

    else

      redirect_to "/app"

    end
  end

  def verification
    @customer_verification = CustomerVerification.new
  end

  def login
    @customer = CustomerVerification.find_by_customer_id(params[:customer_id]) rescue nil
    if @customer != nil
      session[:customer_id] = @customer.id
      redirect_to "/app/dashboard"
    else
      redirect_to "/app/verification"
    end
  end

  def profile
    @customer = Customer.find(session[:customer_id])
  end

  def redflag
    @customer_assets = CustomerAsset.find_all_by_customer_id(session[:customer_id])
  end

  def crime_alert

  end

end