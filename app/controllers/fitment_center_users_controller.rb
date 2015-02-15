class FitmentCenterUsersController < ApplicationController

  def index
    @fitment_center_users = FitmentCenterUser.all
  end

  def new
    @fitment_center_user = FitmentCenterUser.new
  end

  def show

  end

  def create
    @fitment_center_user = FitmentCenterUser.new(params[:fitment_center_user])
    if @fitment_center_user.save
      flash[:notice] = "Successfully created Fitment Center User"
      redirect_to fitment_center_users_path
    else
      render :action => 'new'
    end
  end

  def edit
    @fitment_center_user = FitmentCenterUser.find(params[:id])
  end

  def update
    @fitment_center_user = FitmentCenterUser.find(params[:id])
    params[:fitment_center_user].delete(:password) if params[:fitment_center_user][:password].blank?
    params[:fitment_center_user].delete(:password_confirmation) if params[:fitment_center_user][:password].blank? and params[:fitment_center_user][:password_confirmation].blank?
    if @fitment_center_user.update_attributes(params[:fitment_center_user])
      flash[:notice] = "Successfully updated Fitment Center User"
      redirect_to fitment_center_users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @fitment_center_user = FitmentCenterUser.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted Fitment Center User"
      redirect_to fitment_center_users_path
    end
  end

end