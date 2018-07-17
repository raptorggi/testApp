class CartController < ApplicationController

  def cart
    @products = CookiesBucket.new(cookies).get_products
    @cookie_products = CookiesBucket.new(cookies).get_products_from_cookies
    @products_count = CookiesBucket.new(cookies).get_products_count
  end
end
