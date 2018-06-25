class Admin::FeedbacksController < Admin::ApplicationController
  
  def index
    @feedbacks = Feedback.all
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  def edit
    @feedback = Feedback.find(params[:id])
  end

  def update
    @feedback = Feedback.find(params[:id])
    if @feedback.update(feedback_params)
      redirect_to admin_feedbacks_path
    else
      render :edit
    end
  end

  def destroy
    Feedback.delete(params[:id])
    redirect_to admin_feedbacks_path
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :phone, :message)
  end
end
