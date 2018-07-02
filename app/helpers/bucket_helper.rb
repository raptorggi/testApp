module BucketHelper
  def get_product(cookie_product)
    Product.find_by id: (cookie_product[BucketController.cookie_product_prefix..cookie_product.length - 1]).to_i
  end
end
