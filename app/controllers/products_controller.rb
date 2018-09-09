class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @categories = Category.root
  end

  def show
    @product = Product.find_by slug: params[:slug]
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ProductPdf.new(@product, session[:locale], show_product_url(@product.category.slug, @product.slug, format: 'pdf'))
        send_data pdf.render, disposition: 'inline'
      end
    end
  end

  def category
    @category = Category.find_by slug: params[:slug]
    @products = Product.where category_id: @category.id
  end

  def search
    @categories = Category.search_category(params[:name]) 
    @products = Product.search_product(params[:name])
  end

  def buy
    CookiesBucket.new(cookies).add_product(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:name)
  end
end
