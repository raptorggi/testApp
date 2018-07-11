require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  let(:category) { create :category }
  let(:product) { create :product,  name: 'product'}

  describe '#order' do
    it 'responds successfully' do
      get :order
      expect(response).to be_success
    end

    it 'render template' do
      get :order
      expect(response).to render_template("order")
    end

  end

  describe '#create' do
    it 'redirect to confirmed page if order creation success' do
      post :create, params: {order: {name: "qwe", surname: "1eqwe", address: "testtest", phone: "123123123111", email: "gg@gmail.com", order_product_attributes: {"0" => {product_id: product.id, count: 12}}}}
      expect(response).to redirect_to(confirmed_order_path)
    end

    it 'render template "order" if order creation failed' do
      post :create, params: {order: {name: "231123"}}
      expect(response).to render_template(:order)
    end

    it 'create order' do 
      count = Order.count
      post :create, params: {order: {name: "qwe", surname: "1eqwe", address: "testtest", phone: "123123123111", email: "gg@gmail.com", order_product_attributes: {"0" => {product_id: product.id, count: 12}}}}
      expect(Order.count).to eq(count + 1)
    end

  end

  describe '#confirmed' do
    it 'responds successfully' do
      get :confirmed
      expect(response).to be_success
    end

    it 'render template' do
      get :confirmed
      expect(response).to render_template("confirmed")
    end

  end

end
