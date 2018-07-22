class CartController < ApplicationController
  def cart
    @products = cookies_bucket.get_products
    @cookie_products = cookies_bucket.get_products_from_cookies
    @products_count = cookies_bucket.get_products_count
  end

  private

  def cookies_bucket
    @cookies_bucket ||= CookiesBucket.new(cookies)
  end
end
