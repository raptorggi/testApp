require 'rails_helper'

RSpec.describe CartController, type: :controller do
  let(:category) { create :category }
  let(:product) { create :product,  name: 'product'}
  let(:product2) { create :product, name: 'product2'}
  COOKIE_PRODUCT_PREFIX = "cart_product_"

  before do
    product
    product2
    @request.host = "localhost:3000"
  end

  describe '#cart' do 
    it 'responds successfully' do
      get :cart
      expect(response).to be_success
    end

    it 'render template' do
      get :cart
      expect(response).to render_template("cart")
    end

    it 'have correct products in cart' do
      pending
      post add_product_to_cart_url(product.slug), params: {slug: product.slug}
      post add_product_to_cart_url(product.slug), params: {slug: product.slug}
      post add_product_to_cart_url(product2.slug), params: {slug: product2.slug}
      get :cart
      expect(assigns(:cookie_products)).to eq([["#{COOKIE_PRODUCT_PREFIX}#{product.id}", '2'], ["#{COOKIE_PRODUCT_PREFIX}#{product2.id}", '1']])
    end
  end

end
