require 'rails_helper'

feature 'cart', type: :feature do
  let(:category) { create :category }
  let(:product) { create :product, name: 'Sony Xperia XZ2 Compact DS', category_id: category.id }
  let(:user) { create :user }
  let(:user_admin) { create :user, name: 'Admin', admin: true }

  before do
    user
    user_admin
  end
 
  scenario 'add product', js: true do
    visit show_product_path(category_slug: category.slug, slug: product.slug)
    click_button 'Купить'
    sleep 1
    expect(page.driver.cookies).to include("#{CookiesBucket::COOKIE_PRODUCT_PREFIX}#{product.id}")
  end

  scenario 'show cart page', js: true do
    visit show_product_path(category_slug: category.slug, slug: product.slug)
    click_button 'Cart'
    expect(page).to have_text('Корзина')
  end
end