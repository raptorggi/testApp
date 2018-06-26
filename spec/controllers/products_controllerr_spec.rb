require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_success
    end

    it "render template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  product = Product.create name: 'product 1'
  category = Category.create name: 'cat 1'

  describe '#show' do
    it 'responds successfully' do
      get :show, params: {category_id: category.slug, id: product.slug}
      expect(response).to be_success
    end

    it "render template" do
      get :show, params: {category_id: category.slug, id: product.slug}
      expect(response).to render_template("show")
    end

  end

  describe '#category' do
    it 'responds successfully' do
      get :category, params: {slug: category.slug}
      expect(response).to be_success
    end

    it "render template" do
      get :category, params: {slug: category.slug}
      expect(response).to render_template("category")
    end
    
  end
end
