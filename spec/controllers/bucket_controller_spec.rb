require 'rails_helper'

RSpec.describe BucketController, type: :controller do
  let(:category) { create :category }
  let(:product) { create :product,  name: 'product'}
  let(:product2) { create :product, name: 'product2'}
  COOKIE_PRODUCT_PREFIX = "cart_product_"

  describe '#buy' do
    it 'responds successfully' do
      post :buy, params: {slug: product.slug}
      expect(response).to be_success
    end

    it 'add product to cookies' do
      post :buy, params: {slug: product.slug}
      prod = "#{COOKIE_PRODUCT_PREFIX}#{product.id}"
      expect(cookies[prod]).to eq(1)
    end

    it 'have correct count products in cart' do
      post :buy, params: {slug: product.slug}
      post :buy, params: {slug: product.slug}
      post :buy, params: {slug: product2.slug}
      expect(cookies[:products_count]).to eq(3)
    end
  end

  describe '#bucket' do 
    it 'responds successfully' do
      get :bucket
      expect(response).to be_success
    end

    it 'render template' do
      get :bucket
      expect(response).to render_template("bucket")
    end

    it 'have correct products in cart' do
      post :buy, params: {slug: product.slug}
      post :buy, params: {slug: product.slug}
      post :buy, params: {slug: product2.slug}
      get :bucket
      expect(assigns(:cookie_products)).to eq([["#{COOKIE_PRODUCT_PREFIX}#{product.id}", '2'], ["#{COOKIE_PRODUCT_PREFIX}#{product2.id}", '1']])
    end
  end

end
