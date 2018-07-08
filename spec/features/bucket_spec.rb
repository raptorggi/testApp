require 'rails_helper'

RSpec.describe 'cart', type: :feature do
  let(:category) { create :category }
  let(:product) {create :product, category_id: category.id }
 
  scenario 'add product' do
    pending
    visit show_product_path(category_slug: category.slug, slug: product.slug)
    # byebug
    # page.find(:css, "button[data-product-slug='#{product.slug}']").click
    click_button 'Купить'
    expect(get_me_the_cookies).to include("#{COOKIE_PRODUCT_PREFIX}#{product.id}")
  end
end