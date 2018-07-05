class BucketController < ApplicationController
  skip_before_action :verify_authenticity_token

  def bucket
    @products = CookiesBucket.new(cookies).get_products
    @cookie_products = CookiesBucket.new(cookies).get_products_from_cookies
    @products_count = CookiesBucket.new(cookies).get_products_count
  end

  def buy
    CookiesBucket.new(cookies).add_product_to_cookies(params[:slug])
    CookiesBucket.new(cookies).update_products_count 
  end
end
