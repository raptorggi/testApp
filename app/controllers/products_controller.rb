class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  caches_action :index, :category, :show
  #caches_page :category, :index

  def index
    @categories = Category.root
  end

  def show
    @product = Product.find_by slug: params[:slug]
    fresh_when etag: @product, last_modified: @product.updated_at
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ProductPdf.new(@product, session[:locale], show_product_url(@product.category.slug, @product.slug, format: 'pdf'))
        send_data pdf.render
      end
    end
  end

  def category
    @category = Category.find_by slug: params[:slug]
    @products = Product.where category_id: @category.id
  end

  def buy
    CookiesBucket.new(cookies).add_product_to_cookies(params[:slug])
  end
end
