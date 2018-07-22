require "rails_helper"

describe FeedbacksController, type: :controller do
  describe 'new' do
    it 'response successfully' do
      get :new
      expect(response).to be_success
    end

    it 'feedback be a new' do
      get :new
      expect(assigns(:feedback)).to be_a_new(Feedback)
    end

    it 'assigns feedbacks' do
      create_list(:feedback, 5, name: '1', email: '2', phone: '3', message: '4')
      get :new
      expect(assigns(:feedbacks).count).to eq(5) 
    end
  end
end
