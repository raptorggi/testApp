require 'rails_helper'

RSpec.describe CartController, type: :controller do
  let(:category) { create :category }
  let(:product) { create :product,  name: 'product'}
  let(:product2) { create :product, name: 'product2'}

  before do
    product
    product2
    @request.host = 'localhost:3000'
  end

  describe '#cart' do 
    it 'responds successfully' do
      get :cart
      expect(response).to be_success
    end

    it 'render template' do
      get :cart
      expect(response).to render_template('cart')
    end
  end
end
