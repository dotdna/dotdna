require 'nexmo'
class CustomersController < ApplicationController
  # GET /customers
  # GET /customers.json

  skip_before_filter :authenticate_admin_user!

  before_filter :authenticate_fitment_center_user!

  before_filter :check_stock_levels

  layout 'fitment_center_layout'

  def index

    if fitment_center_user_signed_in?
      @customers = Customer.find_all_by_fitment_centre_id(current_fitment_center_user.fitment_center_id)
    else
      @customers = Customer.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new

    # "TODO: Finish code for checking fitment center user details before adding any additional work"
    #
    # if fitment_center_user_signed_in?
    #   @fitment_center_stock = FitmentCenterStock.find_all_by_fitment_center_id(current_fitment_center_user.fitment_center_id) rescue nil
    # end
    #
    # if @fitment_center_stock.nil? == false
    #
    #   @stock_levels = 0
    #
    #
    #
    # end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])
    @customer.fitment_centre_id = current_fitment_center_user.fitment_center_id
    @customer.guarantee_number = Time.now.to_i

    respond_to do |format|
      if @customer.save

        nexmo = Nexmo::Client.new('8cfe5832', 'f004980a')
        nexmo.send_message!({:to => "#{@customer.cell_number}", :from => 'DotDna', :text => "Welcome to DotDna, Your fitment is now complete. Please note your customer number #{@customer.id}. For additional information please visit http://www.dotdna.co.za"})

        @installed_stock = FitmentCenterStock.find(@customer.customer_assets.first.fitment_center_stock_id) rescue nil

        if @installed_stock != nil

          @installed_stock.qty -= 1
          @installed_stock.save!

        end

        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }

      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end


  private
  def check_stock_levels

     if fitment_center_user_signed_in?

       @fitment_center_stock = FitmentCenterStock.find_all_by_fitment_center_id(current_fitment_center_user.fitment_center_id) rescue nil

       if @fitment_center_stock.count > 0

         @fitment_center_stock.each do |x|

           if x.qty == 0

             @no_stock_warning_label = x.product_name.to_s

           end

         end

       end

       end



     end

end
