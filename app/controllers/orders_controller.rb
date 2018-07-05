class OrdersController < ApplicationController
  def order
    @order = Order.new
    @order.order_products.new
    view_data
  end

  def create
    @order = Order.new order_params
    if @order.save
      CookiesBucket.new(cookies, Product).clear
      redirect_to confirmed_order_path
    else
      view_data
      render :order
    end
  end

  def confirmed

  end

  def order_params
    params.require(:order).permit(:name, :surname, :address, :phone, :email, order_products_attributes: [:product_id, :count])
  end

  def view_data
    @products = CookiesBucket.new(cookies, Product).get_products
    @cookie_products = CookiesBucket.new(cookies, Product).get_products_from_cookies
    @products_id_count = CookiesBucket.new(cookies, Product).get_products_id_count
  end
  
end
