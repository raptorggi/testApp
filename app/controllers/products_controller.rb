class ProductsController < ApplicationController

  def index
    @categories = Category.root
  end

  def show
    @product = Category.find_by(slug: params[:category_slug])&.products&.find_by! slug: params[:slug]
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ProductPdf.new(@product, show_product_url(@product.category.slug, @product.slug, format: 'pdf'))
        send_data pdf.render
      end
    end
  end

  def category
    @category = Category.find_by slug: params[:slug]
    @products = Product.where category_id: @category.id 
  end

end
