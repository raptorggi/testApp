class UserCartsClean
  # удаление устаревших корзин, не дописано
  def clean_old_carts
    carts = UserCarts.find_by created_at: Time.zone.now - 15.minutes
    carts.each do |cart|
      cart.product.update reserved: cart.product.reserved - cart.reserved
      cart.delete
    end
  end
end
