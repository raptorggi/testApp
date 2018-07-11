class OrdersController < ApplicationController
  def order
    @order = Order.new
    @order.order_products.new
    @products = CookiesBucket.new(cookies).get_products_and_count
  end

  def create
    @order = Order.new order_params
    if @order.save
      CookiesBucket.new(cookies).clear
      OrderMailer.order_email_to_users(session[:user_id], @order.id).deliver_now
      OrderMailer.order_email_to_admins(session[:user_id], @order.id).deliver_now
      redirect_to confirmed_order_path
    else
      CookiesBucket.new(cookies).get_products_and_count
      render :order
    end
  end

  def confirmed

  end

  def order_params
    params.require(:order).permit(:name, :surname, :address, :phone, :email, order_products_attributes: [:product_id, :count])
  end
  
end
