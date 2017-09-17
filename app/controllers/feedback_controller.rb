class FeedbackController < ApplicationController
	def create
		@feedback = Feedback.new feedback_params
		if @feedback.save
			redirect_to :index
		else
			render :new
		end
	end

	def feedback_params
		params.require(:feedback).permit(:name, :email, :phone, :message)
	end
	def new
		@feedbacks = Feedback.all
	end
end

