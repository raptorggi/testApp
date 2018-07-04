class BucketController < ApplicationController
  skip_before_action :verify_authenticity_token

  def bucket
    @products = CookiesBucket.new(cookies, Product).get_products
    @cookie_products = CookiesBucket.new(cookies, Product).get_products_from_cookies
    @products_count = CookiesBucket.new(cookies, Product).get_products_count
  end

  def buy
    CookiesBucket.new(cookies, Product).add_product_to_cookies(params[:slug])
    CookiesBucket.new(cookies, Product).update_products_count 
  end
end
