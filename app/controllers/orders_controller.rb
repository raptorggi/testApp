class OrdersController < ApplicationController
  before_action :authenticate_user!

  def order
    @order = Order.new
    @order.order_products.new
    @products = CookiesBucket.new(cookies).products_with_quantity
  end

  def create
    order = current_user.orders.new order_params
    if order.save
      products = params[:order][:order_products_attributes].values
      user_token = CookiesBucket.new(cookies).user_token
      products.each do |product|
        prod = order.products.find { |e| e.id == product[:product_id].to_i }
        prod.user_carts.create! user_token: user_token, quantity: product[:count].to_i, user_id: current_user[:id]
        prod.update reserved: prod.reserved + product[:count].to_i
      end
      CookiesBucket.new(cookies).clear
      OrderMailer.order_email(locale, current_user.email, order.id).deliver_now
      redirect_to confirmed_order_path(locale)
    else
      @products = CookiesBucket.new(cookies).products_with_quantity
      render :order
    end
  end

  def confirmed; end

  def order_params
    params.require(:order).permit(:address, order_products_attributes: %i[product_id count])
  end
end
