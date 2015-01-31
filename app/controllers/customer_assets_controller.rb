class CustomerAssetsController < ApplicationController
  # GET /customer_assets
  # GET /customer_assets.json
  def index
    @customer_assets = CustomerAsset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customer_assets }
    end
  end

  # GET /customer_assets/1
  # GET /customer_assets/1.json
  def show
    @customer_asset = CustomerAsset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer_asset }
    end
  end

  # GET /customer_assets/new
  # GET /customer_assets/new.json
  def new
    @customer_asset = CustomerAsset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer_asset }
    end
  end

  # GET /customer_assets/1/edit
  def edit
    @customer_asset = CustomerAsset.find(params[:id])
  end

  # POST /customer_assets
  # POST /customer_assets.json
  def create
    @customer_asset = CustomerAsset.new(params[:customer_asset])

    respond_to do |format|
      if @customer_asset.save
        format.html { redirect_to @customer_asset, notice: 'Customer asset was successfully created.' }
        format.json { render json: @customer_asset, status: :created, location: @customer_asset }
      else
        format.html { render action: "new" }
        format.json { render json: @customer_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /customer_assets/1
  # PUT /customer_assets/1.json
  def update
    @customer_asset = CustomerAsset.find(params[:id])

    respond_to do |format|
      if @customer_asset.update_attributes(params[:customer_asset])
        format.html { redirect_to @customer_asset, notice: 'Customer asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_assets/1
  # DELETE /customer_assets/1.json
  def destroy
    @customer_asset = CustomerAsset.find(params[:id])
    @customer_asset.destroy

    respond_to do |format|
      format.html { redirect_to customer_assets_url }
      format.json { head :no_content }
    end
  end
end
