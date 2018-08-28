class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  caches_action :index, :tag => 'categories'
  caches_action :category, 
                tag: ->(controller) { controller.category_cache_tag }

  caches_action :show, 
                tag: ->(controller) { controller.product_cache_tag }

  cache_sweeper :products_sweeper, :only => [ :category, :show ]
  cache_sweeper :category_sweeper, :only => [ :category, :index ]

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

  def buy
    CookiesBucket.new(cookies).add_product_to_cookies(params[:slug])
  end

  def category_cache_tag
    ['category', @product.category.id]
  end

  def product_cache_tag 
    ['product', @product.id]
  end
end
