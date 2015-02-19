class InsuranceBrokersController < ApplicationController
  # GET /insurance_brokers
  # GET /insurance_brokers.json
  def index
    @insurance_brokers = InsuranceBroker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @insurance_brokers }
    end
  end

  # GET /insurance_brokers/1
  # GET /insurance_brokers/1.json
  def show
    @insurance_broker = InsuranceBroker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @insurance_broker }
    end
  end

  # GET /insurance_brokers/new
  # GET /insurance_brokers/new.json
  def new
    @insurance_broker = InsuranceBroker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @insurance_broker }
    end
  end

  # GET /insurance_brokers/1/edit
  def edit
    @insurance_broker = InsuranceBroker.find(params[:id])
  end

  # POST /insurance_brokers
  # POST /insurance_brokers.json
  def create
    @insurance_broker = InsuranceBroker.new(params[:insurance_broker])

    respond_to do |format|
      if @insurance_broker.save
        format.html { redirect_to @insurance_broker, notice: 'Insurance broker was successfully created.' }
        format.json { render json: @insurance_broker, status: :created, location: @insurance_broker }
      else
        format.html { render action: "new" }
        format.json { render json: @insurance_broker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /insurance_brokers/1
  # PUT /insurance_brokers/1.json
  def update
    @insurance_broker = InsuranceBroker.find(params[:id])

    respond_to do |format|
      if @insurance_broker.update_attributes(params[:insurance_broker])
        format.html { redirect_to @insurance_broker, notice: 'Insurance broker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @insurance_broker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_brokers/1
  # DELETE /insurance_brokers/1.json
  def destroy
    @insurance_broker = InsuranceBroker.find(params[:id])
    @insurance_broker.destroy

    respond_to do |format|
      format.html { redirect_to insurance_brokers_url }
      format.json { head :no_content }
    end
  end
end
