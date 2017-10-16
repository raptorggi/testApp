class FeedbacksController < ApplicationController
  def new
    @feedbacks = Feedback.all
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new feedback_params
    if @feedback.save
      redirect_to new_feedback_path
    else
      @feedbacks = Feedback.all
      render :new
    end
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :phone, :message)
  end
end

