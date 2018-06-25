require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  
  before do
    user_admin = User.create(name: "qwerty", email: "1234", password: "111111", admin: true)
    session[:user_id] = user_admin.id
  end

  describe '#index' do
    it 'response successfully' do
      get :index
      expect(response).to be_success
    end

    it "return collection" do
      users = User.all
      get :index
      expect(assigns(:users)).to eq(users)
    end
  end

  describe '#show' do
    it 'responds successfully' do
      user = User.create(name: 'test', email: 'test', password: '111111')
      get :show, params: {id: user.id}
      expect(response).to be_success
    end

    it "return same page" do
      user = create(:user) 
      get :show, params: {id: user.id}
      expect(assigns(:user)).to eq(user)   
    end
  end

  describe '#edit' do
    it 'responds successfully' do
      user = User.create(name: 'test', email: 'test', password: '111111')
      get :edit, params: {id: user.id}
      expect(response).to be_success
    end

    it "return same page" do
      user = create(:user) 
      get :edit, params: {id: user.id}
      expect(assigns(:user)).to eq(user)   
    end
  end

  describe '#new' do
    it 'responds successfully' do
      get :new
      expect(response).to be_success
    end
  end

  describe '#create' do
    it 'responds successfully' do
      post :create, params: {user: {name: 'test', email: 'test', password: '111111'}}
      expect(response).to be_redirect
    end

    it 'redirect to user if user creation success' do
      post :create, params: {user: {name: 'test', email: 'test', password: '111111'}}
      user = User.find_by email: 'test'
      expect(response).to redirect_to(admin_user_path(user.id))
    end

    it 'render template "new user" if user creation failed' do
      post :create, params: {user: {name: 'test', email: 'test', password: '1111'}}
      expect(response).to render_template(:new)
    end

    it 'create user' do
      count = User.count
      post :create, params: {user: {name: 'test', email: 'test', password: '111111'}}
      expect(User.count).to eq(count + 1)
    end
  end

  describe '#destroy' do
    it 'responds successfully' do
      user = User.create(name: 'test', email: 'test', password: '111111')
      delete :destroy, params: {id: user.id}
      expect(response).to be_redirect
    end
  end

  describe '#update' do
    it 'update user' do
      user = User.create(name: 'test', email: 'test', password: '111111')
      put :update, params: {id: user.id, user: {name: 'testqwe', email: 'test', password: '111111'}}
      user = User.find(user.id)
      expect(user.name).to eq('testqwe')
    end
  end
end
