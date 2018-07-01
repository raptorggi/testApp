module BucketHelper
  def get_product(product_cookie)
    return Product.find_by id: (product_cookie[13..product_cookie.length - 1]).to_i
  end
end
