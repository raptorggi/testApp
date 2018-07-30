require 'rails_helper'

feature 'order', type: :feature do
  let(:category) { create :category }
  let(:product) { create :product, name: 'Sony Xperia XZ2 Compact DS', category_id: category.id }
  let(:user) { create :user }
  let(:user_admin) { create :admin_user }

  before do
    user
    user_admin
  end

  scenario 'show order page and create order', js: true do
    visit new_user_session_path
    fill_in 'E-mail', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit show_product_path(category_slug: category.slug, slug: product.slug)
    click_button 'Купить'
    click_button 'Cart'
    expect(page).to have_text 'Корзина'
    click_button 'Оформить заказ'
    expect(page).to have_text 'Оформление заказа'
    fill_in 'Name', with: 'konstantin'
    fill_in 'Surname', with: 'test'
    fill_in 'Phone number', with: '89147221618'
    fill_in 'Address', with: 'selo kukuevo'
    fill_in 'E-mail', with: 'test@testapp.com'
    click_button 'Оформить'
    expect(page).to have_text 'Спасибо за покупку!'
    expect(Order.find_by(name: 'konstantin').surname).to eq('test')
  end
end
