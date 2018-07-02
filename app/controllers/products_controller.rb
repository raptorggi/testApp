class ProductsController < ApplicationController
  def index
    @categories = Category.root
  end

  def show
    @product = Category.find_by(slug: params[:category_slug])&.products&.find_by! slug: params[:slug]
  end

  def category
    @category = Category.find_by slug: params[:slug]
    @products = Product.where category_id: @category.id 
  end

end
