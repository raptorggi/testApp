class CookiesBucket
  COOKIE_PRODUCT_PREFIX = 'cart_product_'.freeze

  def initialize(cookies)
    @cookies = cookies
    @cookies[:token] = SecureRandom.uuid unless @cookies.key?('token')
  end

  def add_product_to_cookies(slug)
    product = "#{COOKIE_PRODUCT_PREFIX}#{(Product.find_by slug: slug).id}"
    @cookies[product] = if @cookies[product]
                          @cookies[product].to_i + 1
                        else
                          1
                        end
    update_products_count
  end

  def update_products_count
    @cookies[:products_count] = 0
    products = @cookies.select { |prod, _value| prod.include? COOKIE_PRODUCT_PREFIX }
    products.each do |product|
      @cookies[:products_count] += product[1].to_i
    end
  end

  def get_products_from_cookies
    (@cookies.select { |prod, _value| prod.include? COOKIE_PRODUCT_PREFIX }).sort
  end

  def get_products_and_count
    products = get_products
    products_and_count = {}
    products.each do |product|
      products_and_count[product] = @cookies["#{COOKIE_PRODUCT_PREFIX}#{product.id}"]
    end
    products_and_count
  end

  def get_products
    products = get_products_from_cookies
    products_id = []
    products.each do |product|
      products_id.push product[0][COOKIE_PRODUCT_PREFIX.length..product[0].length - 1]
    end
    products = Product.where id: products_id
    products.order('id')
  end

  def clear
    @cookies.clear
    @cookies[:products_count] = 0
  end

  def get_products_count
    @cookies[:products_count].to_i
  end

  def get_user_token
    @cookies[:token]
  end
end
