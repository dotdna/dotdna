class CustomerFeedbacksController < ApplicationController

  skip_before_filter :authenticate_fitment_center_user!

  skip_before_filter :authenticate_admin_user!

  before_filter :set_customer_feedback, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @customer_feedbacks = CustomerFeedback.all
    respond_with(@customer_feedbacks)
  end

  def show
    respond_with(@customer_feedback)
  end

  def new
    @customer_feedback = CustomerFeedback.new
    respond_with(@customer_feedback)
  end

  def edit
  end

  def create
    @customer_feedback = CustomerFeedback.new(params[:customer_feedback])
    if @customer_feedback.save

      flash[:success] = "Thank you for contacting us. One of our representatives withh be in touch with you within 24 hours."
      redirect_to "/app/dashboard"

    else

      flash[:notice] = "Error Submitting Form. Please try again.."
      redirect_to "/app/contactus"

    end

    # respond_with(@customer_feedback)
  end

  def update
    @customer_feedback.update_attributes(params[:customer_feedback])
    respond_with(@customer_feedback)
  end

  def destroy
    @customer_feedback.destroy
    respond_with(@customer_feedback)
  end

  private
    def set_customer_feedback
      @customer_feedback = CustomerFeedback.find(params[:id])
    end
end
