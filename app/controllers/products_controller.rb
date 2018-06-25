class ProductsController < ApplicationController
	def index
    @categories = Category.root
	end

  def show
    @product = Product.find_by slug: params[:id]
  end

  def category
    @category = Category.find_by slug: params[:slug]
    @products = Product.where category_id: @category.id
  end
end
