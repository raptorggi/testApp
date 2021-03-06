require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_successful
    end

    it 'render template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  let(:category) { create :category }
  let(:product) { create :product, category_id: category.id }
  let(:product2) { create :product, category_id: category.id }

  describe '#show' do
    it 'responds successfully' do
      get :show, params: { category_slug: category.slug, slug: product.slug }
      expect(response).to be_successful
    end

    it 'returns requested product' do
      get :show, params: { category_slug: category.slug, slug: product.slug }
      expect(assigns(:product).id).to eq(product.id)
    end
  end

  describe '#category' do
    it 'responds successfully' do
      get :category, params: { slug: category.slug }
      expect(response).to be_successful
    end

    it 'returns requested category' do
      get :category, params: { slug: category.slug }
      expect(assigns(:category).id).to eq(category.id)
    end
  end

  describe '#show pdf' do
    it 'responds successfully' do
      get :show, as: 'pdf', params: { category_slug: category.slug, slug: product.slug }
      expect(response).to be_successful
    end
  end

  describe '#buy' do
    it 'responds successfully' do
      post :buy, params: { id: product.id }
      expect(response).to be_successful
    end

    it 'add product to cookies' do
      post :buy, params: { id: product.id }
      prod = "#{CookiesBucket::COOKIE_PRODUCT_PREFIX}#{product.id}"
      expect(cookies[prod]).to eq(1)
    end

    it 'have correct count products in cart' do
      post :buy, params: { id: product.id }
      post :buy, params: { id: product.id }
      post :buy, params: { id: product2.id }
      expect(cookies[:products_quantity]).to eq(3)
    end
  end

  let(:category_search) { create :category, name_ru: 'product category', name_en: 'product category' }
  let(:product_search) { create :product, category_id: category_search.id }

  describe '#search' do
    it 'responds successfully' do
      get :search
      expect(response).to be_successful
    end

    it 'returns requested product' do
      product_search
      get :search, params: {name: 'prod'}
      expect(assigns(:products)[0].id).to eq(product_search.id)
    end

    it 'returns requested category' do
      category_search
      get :search, params: {name: 'prod'}
      expect(assigns(:categories)[0].id).to eq(category_search.id)
    end 
  end
end
