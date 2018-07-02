require 'rails_helper'

RSpec.describe BucketHelper, type: :helper do
  describe "get_product" do
    let(:category) {Category.create name: 'cat 1'}
    let(:product) {category.products.create name: 'product 1'}
    it "should return product object" do
      expect(get_product("cart_product_".concat product.id.to_s)).to eq(product)
    end
  end
end
