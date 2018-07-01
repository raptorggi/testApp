class BucketController < ApplicationController
  skip_before_action :verify_authenticity_token

  def bucket
    @products_cookie = cookies.select { |prod, value| prod.include? "cart_product_"}
  end

  def buy
    product = "cart_product_" + (Product.find_by slug: params[:slug]).id.to_s
    if cookies[product]
      cookies[product] = cookies[product].to_i + 1
    else
      cookies[product] = 1
    end
    cookies[:products_count] = 0
    products = cookies.select { |prod, value| prod.include? "cart_product_"}
    products.each do |product|
      cookies[:products_count] += product[1].to_i
    end
  end

end
