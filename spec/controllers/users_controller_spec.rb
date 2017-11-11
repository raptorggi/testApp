require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#new' do
    it 'responds successfully' do
      get :new
      expect(response).to be_success
    end
  end

  describe '#create' do
    it 'redirect to user page if user creation success' do
      post :create, params: {user: {name: "qwe", email: "qwe", password: "111111", password_confirmation: "111111"}}
      expect(response).to redirect_to(users_path)
    end

    it 'render template "new feedback" if user creation failed' do
      post :create, params: {user: {name: "qwe", email: "qwe", password: "1111", password_confirmation: "1111"}}
      expect(response).to render_template(:new)
    end

    it 'create user' do
      count = User.count
      post :create, params: {user: {name: "qwe", email: "qwe", password: "111111", password_confirmation: "111111"}}
      expect(User.count).to eq(count + 1)
    end
  end

  describe '#index' do
    it 'responds successfully' do
      user = User.create(name: "qwerty", email: "1234", password: "111111")
      session[:user_id] = user.id
      get :index
      expect(response).to be_success
    end

    it 'assigns user by session' do
      user = User.create(name: "qwerty", email: "1234", password: "111111")
      session[:user_id] = user.id
      get :index
      expect(assigns(:user)).to eq(user)
    end
  end
end
