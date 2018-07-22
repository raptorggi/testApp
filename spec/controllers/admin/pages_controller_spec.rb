require 'rails_helper'

RSpec.describe Admin::PagesController, type: :controller do
  before do
    user_admin = User.create(name: 'qwerty', email: '1234', password: '111111', admin: true)
    session[:user_id] = user_admin.id
  end

  describe '#index' do
    it 'response successfully' do
      get :index
      expect(response).to be_success
    end

    it 'return collection' do
      pages = Page.all
      get :index
      expect(assigns(:pages)).to eq(pages)
    end
  end

  describe '#show' do
    it 'responds successfully' do
      page = Page.create(title: 'test 1', text: 'qwerty')
      get :show, params: { id: page.id }
      expect(response).to be_success
    end

    it 'return same page' do
      page = create(:page)
      get :show, params: { id: page.id }
      expect(assigns(:page)).to eq(page)
    end
  end

  describe '#edit' do
    it 'responds successfully' do
      page = Page.create(title: 'test 1', text: 'qwerty')
      get :edit, params: { id: page.id }
      expect(response).to be_success
    end

    it 'return same page' do
      page = create(:page)
      get :edit, params: { id: page.id }
      expect(assigns(:page)).to eq(page)
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
      post :create, params: { page: { title: 'test 1', text: 'qwerty' } }
      expect(response).to be_redirect
    end

    it 'redirect to page if page creation success' do
      post :create, params: { page: { title: 'test 1', text: 'qwerty' } }
      expect(response).to redirect_to(admin_page_path('test-1'))
    end

    it 'render template "new page" if page creation failed' do
      post :create, params: { page: { title: 'test 1' } }
      expect(response).to render_template(:new)
    end

    it 'create page' do
      count = Page.count
      post :create, params: { page: { title: 'test 1', text: 'qwerty' } }
      expect(Page.count).to eq(count + 1)
    end
  end

  describe '#destroy' do
    it 'responds successfully' do
      page = Page.create(title: 'test 1', text: 'qwerty')
      delete :destroy, params: { id: page.id }
      expect(response).to be_redirect
    end
  end

  describe '#update' do
    it 'update page' do
      page = Page.create(title: 'test 1', text: 'qwerty')
      put :update, params: { id: page.id, page: { title: '1234', text: 'qqqwww' } }
      page = Page.find(page.id)
      expect(page.text).to eq('qqqwww')
    end
  end
end
