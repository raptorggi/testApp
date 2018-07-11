class OrderMailer < ApplicationMailer
  default from: 'no-reply@testapp.com'

  def order_email_to_users user_id, order_id
    @user = User.find user_id
    @order = Order.find order_id
    admins = User.where admin: true 
    mail(to: @user.email, subject: "Order ##{@order.id}").deliver
  end

  def order_email_to_admins user_id, order_id
    @user = User.find user_id
    @order = Order.find order_id
    admins = User.where admin: true 
    mail(to: admins.pluck(:email), subject: "user #{@user.name} order ##{@order.id}").deliver
  end
end
