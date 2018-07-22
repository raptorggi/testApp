class ProductPdf < Prawn::Document
  require 'open-uri'

  def initialize(product, url)
    super(top_margin: 40)
    font(Rails.root.join('app', 'assets', 'fonts', 'OpenSans-Regular.ttf'))
    @product = product
    @url = url
    product_url
    product_header
    product_image
    product_description
  end

  def product_url
    text @url.to_s, size: 8, align: :right
  end

  def product_header
    move_down 20
    text @product.name.to_s, size: 15, align: :center
  end

  def product_description
    move_down 20
    text @product.description.to_s, size: 11, align: :center
  end

  def product_image
    path = @product.image.url(:large).split('?')
    image open "#{Rails.root}/public#{path[0]}"
  end
end
