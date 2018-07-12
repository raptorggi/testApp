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

  let(:category) {Category.create name: 'cat 1'}
  let(:product) {category.products.create name: 'product 1'}

  describe '#show' do
    it 'responds successfully' do
      get :show, params: {category_slug: category.slug, slug: product.slug}
      expect(response).to be_success
    end

    it "returns requested product" do
      get :show, params: {category_slug: category.slug, slug: product.slug}
      expect(assigns(:product).id).to eq(product.id)
    end
  end

  describe '#category' do
    it 'responds successfully' do
      get :category, params: {slug: category.slug}
      expect(response).to be_success
    end

    it "returns requested category" do
      get :category, params: {slug: category.slug}
      expect(assigns(:category).id).to eq(category.id)
    end
  end

  describe '#show pdf' do
    it 'responds successfully' do
      get :show, as: 'pdf', params: {category_slug: category.slug, slug: product.slug}
      expect(response).to be_success
    end
  end
end
