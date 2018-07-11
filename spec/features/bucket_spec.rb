require 'rails_helper'

feature 'cart', type: :feature do
  let(:category) { create :category }
  let(:product) { create :product, name: 'Sony Xperia XZ2 Compact DS', category_id: category.id }
 
  scenario 'add product', js: true do
    visit show_product_path(category_slug: category.slug, slug: product.slug)
    click_button 'Купить'
    sleep 0.01
    expect(page.driver.cookies).to include("#{CookiesBucket::COOKIE_PRODUCT_PREFIX}#{product.id}")
  end
end