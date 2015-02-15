class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json

  before_filter :authenticate_fitment_center_user!
  before_filter :check_fitmentcenter_login

  skip_before_filter :authenticate_admin_user!

  layout 'fitment_center_layout'

  def index

    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def confirm_order

    @order = Order.find(params[:order_id])
    @order.ref_number = params[:ref_number]
    @order.save!

    respond_to do |format|

      format.html
      format.json { render json: @order}

    end

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    @line_total_nil = 0.0

    @order.order_lines.each do |x|

      if x.line_total != nil

        @line_total_nil += x.line_total

      end

    end


    @order.total = @line_total_nil
    @order.save!


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @order.dispatched = false
    @order.fitment_center_id = current_fitment_center_user.fitment_center_id


    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private

  def check_fitmentcenter_login

    if session[:fitmentcenter].nil? == false

      @orders = Order.find_all_by_fitment_center_id(current_fitment_center_user.fitment_center_id)

    end

  end

end
