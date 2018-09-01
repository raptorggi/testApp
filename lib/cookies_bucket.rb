class CookiesBucket
  COOKIE_PRODUCT_PREFIX = 'cart_product_'.freeze

  def initialize(cookies)
    @cookies = cookies
    @cookies[:token] = SecureRandom.uuid unless @cookies.key?('token')
    @cookies[:products_quantity] = 0 unless @cookies.key?('products_quantity')
  end

  def add_product(id)
    product = "#{COOKIE_PRODUCT_PREFIX}#{id}"
    @cookies[product] = @cookies[product] ? @cookies[product].to_i + 1 : 1
    update_products_quantity
  end

  def update_products_quantity
    @cookies[:products_quantity] = 0
    products = @cookies.select { |prod, _value| prod.include? COOKIE_PRODUCT_PREFIX }
    products.each do |product|
      @cookies[:products_quantity] += product[1].to_i
    end
  end

  def cookies
    @cookies.select { |prod, _value| prod.include? COOKIE_PRODUCT_PREFIX }.sort
  end

  def products_with_quantity
    products_and_quantity = {}
    products.each do |product|
      products_and_quantity[product] = @cookies["#{COOKIE_PRODUCT_PREFIX}#{product.id}"]
    end
    products_and_quantity
  end

  def products
    products_id = []
    cookies.each do |product|
      products_id.push product[0][COOKIE_PRODUCT_PREFIX.length..product[0].length - 1]
    end
    products = Product.where(id: products_id).order('id')
  end

  def clear
    @cookies.clear
    @cookies[:products_quantity] = 0
  end

  def quantity
    @cookies[:products_quantity].to_i
  end

  def user_token
    @cookies[:token]
  end
end
