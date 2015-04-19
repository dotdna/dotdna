class DashboardController < ApplicationController

  def index

  end

  def admin

    if admin_user_signed_in?

      if current_admin_user.email == "joe@dotdna.co.za"

        redirect_to "/insurer_dashboard"

      end


    end

  end

  def fitmentcenter_stock

  end

  def insurer_dashboard

  end

  def order_dispatch

    @order = Order.find(params[:id])

    #get the details of the order
    @fitment_centre = FitmentCenter.find(@order.fitment_center_id)

    #get order details
    @order.order_lines.each do |x|

      @product_id = x.product_id
      @qty = x.qty

      @fitment_centre_stock = FitmentCenterStock.find_by_fitment_center_id_and_product_id(@order.fitment_center_id, x.product_id) rescue nil

      if @fitment_centre_stock != nil

        if @order.dispatched == false
          @fitment_centre_stock.qty += @qty
          @fitment_centre_stock.save!
        end

      end

    end

    @order.dispatched = true
    @order.save!

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end

  end

end