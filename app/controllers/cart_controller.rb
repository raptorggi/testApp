class CartController < ApplicationController
  def cart
    @products = cookies_cart.products
    @cookies = cookies_cart.cookies
    @product_quantity = cookies_cart.quantity
  end

  private

  def cookies_cart
    @cookies_cart ||= CookiesBucket.new(cookies)
  end
end
