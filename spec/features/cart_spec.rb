require 'rails_helper'

feature 'cart', type: :feature do
  let(:category) { create :category }
  let(:product) { create :product, category_id: category.id }

  scenario 'add product', js: true do
    visit show_product_path(category_slug: category.slug, slug: product.slug)
    click_button 'Купить'
    sleep 1
    expect(page.driver.cookies).to include("#{CookiesBucket::COOKIE_PRODUCT_PREFIX}#{product.id}")
  end

  scenario 'show cart page', js: true do
    visit show_product_path(category_slug: category.slug, slug: product.slug)
    click_button 'Корзина'
    expect(page).to have_text('Корзина')
  end
end
