class CookiesBucket
  COOKIE_PRODUCT_PREFIX = "cart_product_"

  def initialize(cookies, product)
    @cookies = cookies
    @product = product
  end

  def add_product_to_cookies(slug)
    product = "#{COOKIE_PRODUCT_PREFIX}#{(@product.find_by slug: slug).id}"
    if @cookies[product]
      @cookies[product] = @cookies[product].to_i + 1
    else
      @cookies[product] = 1
    end
  end

  def update_products_count
    @cookies[:products_count] = 0
    products = @cookies.select { |prod, value| prod.include?  COOKIE_PRODUCT_PREFIX }
    products.each do |product|
      @cookies[:products_count] += product[1].to_i
    end
  end

  def get_products_from_cookies
    @cookies.select { |prod, value| prod.include? COOKIE_PRODUCT_PREFIX }
  end

  def get_products
    products = get_products_from_cookies
    products_id = []
    products.each do |product|
      products_id.push product[0][COOKIE_PRODUCT_PREFIX.length..product[0].length - 1]
    end
    @product.where id: products_id
  end

end
