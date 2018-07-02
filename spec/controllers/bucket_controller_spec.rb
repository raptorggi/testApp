require 'rails_helper'

RSpec.describe BucketController, type: :controller do

  let(:category) {Category.create name: 'cat 1'}
  let(:product) {category.products.create name: 'product 1'}
  let(:product2) {category.products.create name: 'product 2'}

  describe '#buy' do
    it 'responds successfully' do
      post :buy, params: {slug: product.slug}
      expect(response).to be_success
    end

    it 'add product to cookies' do
      post :buy, params: {slug: product.slug}
      prod = "cart_product_".concat product.id.to_s
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

    it 'have correct products in' do
      post :buy, params: {slug: product.slug}
      post :buy, params: {slug: product.slug}
      post :buy, params: {slug: product2.slug}
      get :bucket
      expect(assigns(:products_cookie)).to eq([["cart_product_".concat(product.id.to_s), "2"], ["cart_product_".concat(product2.id.to_s), "1"]])
    end
  end

end
