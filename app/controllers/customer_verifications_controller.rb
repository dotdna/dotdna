class CustomerVerificationsController < ApplicationController
  before_filter :set_customer_verification, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @customer_verifications = CustomerVerification.all
    respond_with(@customer_verifications)
  end

  def show
    respond_with(@customer_verification)
  end

  def new
    @customer_verification = CustomerVerification.new
    respond_with(@customer_verification)
  end

  def edit
  end

  def create
    @customer_verification = CustomerVerification.new(params[:customer_verification])
    @customer = Customer.find_by_cell_number(params[:customer_verification][:cell_number])rescue nil
    if @customer.nil? == false
      nexmo = Nexmo::Client.new(key: '8cfe5832', secret: 'f004980a')
      nexmo.send_message(to: "#{@customer.cell_number}", from: 'DotDna', text: "DotDna App Verification Code: #{}")
      @customer_verification.verification_code =
    else

    end
    @customer_verification.save
    respond_with(@customer_verification)
  end

  def update
    @customer_verification.update_attributes(params[:customer_verification])
    respond_with(@customer_verification)
  end

  def destroy
    @customer_verification.destroy
    respond_with(@customer_verification)
  end

  private
    def set_customer_verification
      @customer_verification = CustomerVerification.find(params[:id])
    end
end
