class FitmentCenterStocksController < ApplicationController
  # GET /fitment_center_stocks
  # GET /fitment_center_stocks.json
  def index
    @fitment_center_stocks = FitmentCenterStock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fitment_center_stocks }
    end
  end

  # GET /fitment_center_stocks/1
  # GET /fitment_center_stocks/1.json
  def show
    @fitment_center_stock = FitmentCenterStock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fitment_center_stock }
    end
  end

  # GET /fitment_center_stocks/new
  # GET /fitment_center_stocks/new.json
  def new
    @fitment_center_stock = FitmentCenterStock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fitment_center_stock }
    end
  end

  # GET /fitment_center_stocks/1/edit
  def edit
    @fitment_center_stock = FitmentCenterStock.find(params[:id])
  end

  # POST /fitment_center_stocks
  # POST /fitment_center_stocks.json
  def create
    @fitment_center_stock = FitmentCenterStock.new(params[:fitment_center_stock])

    respond_to do |format|
      if @fitment_center_stock.save
        format.html { redirect_to @fitment_center_stock, notice: 'Fitment center stock was successfully created.' }
        format.json { render json: @fitment_center_stock, status: :created, location: @fitment_center_stock }
      else
        format.html { render action: "new" }
        format.json { render json: @fitment_center_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fitment_center_stocks/1
  # PUT /fitment_center_stocks/1.json
  def update
    @fitment_center_stock = FitmentCenterStock.find(params[:id])

    respond_to do |format|
      if @fitment_center_stock.update_attributes(params[:fitment_center_stock])
        format.html { redirect_to @fitment_center_stock, notice: 'Fitment center stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fitment_center_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fitment_center_stocks/1
  # DELETE /fitment_center_stocks/1.json
  def destroy
    @fitment_center_stock = FitmentCenterStock.find(params[:id])
    @fitment_center_stock.destroy

    respond_to do |format|
      format.html { redirect_to fitment_center_stocks_url }
      format.json { head :no_content }
    end
  end
end
