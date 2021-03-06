class OrderMailer < ApplicationMailer
  helper ApplicationHelper
  default from: 'no-reply@testapp.com'

  def order_email_to_users(locale, user_email, order_id)
    @order = Order.find order_id
    @user_email = user_email
    @locale = locale
    mail(to: user_email, subject: "Order ##{@order.id}", template_name: 'order_email_to_users').deliver
  end

  def order_email_to_admins(locale, user_email, order_id)
    @order = Order.find order_id
    @user_email = user_email
    @locale = locale
    admins = AdminUser.all
    mail(to: admins.pluck(:email), subject: "user order ##{@order.id}", template_name: 'order_email_to_admins').deliver
  end

  def order_email(locale, user_email, order_id)
    order_email_to_users locale, user_email, order_id
    order_email_to_admins locale, user_email, order_id
  end
end
