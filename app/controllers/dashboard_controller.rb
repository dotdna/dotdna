class DashboardController < ApplicationController

  def index

  end

  def admin

  end

  def order_dispatch

    @order = Order.find(params[:id])

    #get the details of the order
    @fitment_centre = FitmentCenter.find(@order.fitment_center_id)

    #get order details
    @order.order_lines.each do |x|

      @product_id = x.product_id
      @qty = x.qty

      @fitment_centre.fitment_center_stocks.each do |y|

        if y.product_id == @product_id

          y.qty += @qty
          y.save!

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