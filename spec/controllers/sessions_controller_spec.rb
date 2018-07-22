require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#new' do
    it 'responds successfully' do
      get :new
      expect(response).to be_success
    end
  end

  describe '#create' do
    let(:user) { User.create(name: 'qwerty', email: '1234', password: '111111') }

    before do
      user
    end

    it 'redirect to user page if auth success' do
      post :create, params: { session: { email: '1234', password: '111111' } }
      expect(response).to redirect_to(root_path)
    end

    it 'set session with user id' do
      post :create, params: { session: { email: '1234', password: '111111' } }
      expect(session[:user_id]).to eq(user.id)
    end

    it 'render template with auth form if auth failed' do
      post :create, params: { session: { email: 'qweqw', password: '111111' } }
      expect(response).to render_template(:new)
    end

    it 'set flash message if auth failed' do
      post :create, params: { session: { email: 'qweqw', password: '111111' } }
      expect(flash[:error]).to match('Invalid email/password combination')
    end
  end

  describe '#destroy' do
    it 'responds successfully' do
      user = User.create(name: 'qwerty', email: 'qwerty', password: '12312321')
      session[:user_id] = user.id
      delete :destroy, params: { id: user.id }
      expect(response).to be_redirect
    end

    it 'nullify user session' do
      user = User.create(name: 'qwerty', email: 'qwerty', password: '12312321')
      session[:user_id] = user.id
      delete :destroy, params: { id: user.id }
      expect(session[:user_id]).to eq(nil)
    end

    it 'redirect to index' do
      user = User.create(name: 'qwerty', email: 'qwerty', password: '12312321')
      session[:user_id] = user.id
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to(:index)
    end
  end

  describe '#callback' do
    it 'redirect to root after auth' do
    end

    it 'render #new if auth failed' do
    end

    it 'create new user' do
    end
  end
end
