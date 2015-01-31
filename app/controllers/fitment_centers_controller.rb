class FitmentCentersController < ApplicationController
  # GET /fitment_centers
  # GET /fitment_centers.json
  def index
    @fitment_centers = FitmentCenter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fitment_centers }
    end
  end

  # GET /fitment_centers/1
  # GET /fitment_centers/1.json
  def show
    @fitment_center = FitmentCenter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fitment_center }
    end
  end

  # GET /fitment_centers/new
  # GET /fitment_centers/new.json
  def new
    @fitment_center = FitmentCenter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fitment_center }
    end
  end

  # GET /fitment_centers/1/edit
  def edit
    @fitment_center = FitmentCenter.find(params[:id])
  end

  # POST /fitment_centers
  # POST /fitment_centers.json
  def create
    @fitment_center = FitmentCenter.new(params[:fitment_center])

    respond_to do |format|
      if @fitment_center.save
        format.html { redirect_to @fitment_center, notice: 'Fitment center was successfully created.' }
        format.json { render json: @fitment_center, status: :created, location: @fitment_center }
      else
        format.html { render action: "new" }
        format.json { render json: @fitment_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fitment_centers/1
  # PUT /fitment_centers/1.json
  def update
    @fitment_center = FitmentCenter.find(params[:id])

    respond_to do |format|
      if @fitment_center.update_attributes(params[:fitment_center])
        format.html { redirect_to @fitment_center, notice: 'Fitment center was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fitment_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fitment_centers/1
  # DELETE /fitment_centers/1.json
  def destroy
    @fitment_center = FitmentCenter.find(params[:id])
    @fitment_center.destroy

    respond_to do |format|
      format.html { redirect_to fitment_centers_url }
      format.json { head :no_content }
    end
  end
end
