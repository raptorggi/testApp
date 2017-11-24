require 'rails_helper'

RSpec.describe Admin::FeedbacksController, type: :controller do
  
  before do
    user_admin = User.create(name: "qwerty", email: "1234", password: "111111", admin: true)
    session[:user_id] = user_admin.id
  end
  
  describe '#index' do
    it "response successfully" do
      get :index
      expect(response).to be_success
    end

    it "return collection" do
      feedbacks = Feedback.all
      get :index
      expect(assigns(:feedbacks)).to eq(feedbacks)
    end
  end

  describe '#show' do
    it 'response successfully' do
      feedback = Feedback.create(name: 'test', email: 'test', phone: 'test', message: 'test') 
      get :show, params: {id: feedback.id}
      expect(response).to be_success
    end
      
    it "return same page" do
      feedback = create(:feedback) 
      get :show, params: {id: feedback.id}
      expect(assigns(:feedback)).to eq(feedback)   
    end
end

  describe '#edit' do
    it 'response successfully' do
      feedback = Feedback.create(name: 'test', email: 'test', phone: 'test', message: 'test') 
      get :show, params: {id: feedback.id}
      expect(response).to be_success
    end

    it "return same page" do
      feedback = create(:feedback) 
      get :edit, params: {id: feedback.id}
      expect(assigns(:feedback)).to eq(feedback)   
    end
  end

  describe '#update' do
    it "update feedback" do
      feedback = Feedback.create(name: 'test', email: 'test', phone: 'test', message: 'test')
      put :update, params: {id: feedback.id, feedback: {name: '1234', email: '1234', phone: 'test', message: 'test'}}
      feedback = Feedback.find(feedback.id)
      expect(feedback.name).to eq('1234')
    end

    it 'redirect to feedbacks' do
      feedback = Feedback.create(name: 'test', email: 'test', phone: 'test', message: 'test')
      put :update, params: {id: feedback.id, feedback: {name: '1234', email: '1234', phone: 'test', message: 'test'}}
      expect(response).to redirect_to(admin_feedbacks_path)
    end
  end

  describe '#destroy' do
    it 'response successfully' do
      feedback = Feedback.create(name: 'test', email: 'test', phone: 'test', message: 'test')
      delete :destroy, params: {id: feedback.id}
      expect(response).to be_redirect
    end

    it 'redirect to feedbacks' do
      feedback = Feedback.create(name: 'test', email: 'test', phone: 'test', message: 'test')
      delete :destroy, params: {id: feedback.id}
      expect(response).to redirect_to(admin_feedbacks_path)
    end
  end
end
