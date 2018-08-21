class ProductsSweeper < ActionController::Caching::Sweeper
  observe Product

  def after_create(product)
    expire_cache_for(product)
  end

  def after_update(product)
    expire_cache_for(product)
  end

  def after_destroy(product)
    expire_cache_for(product)
  end

  private

  def expire_cache_for(record)
    Cashier.expire 'products_category'
    Cashier.expire 'products_show'
  end
end