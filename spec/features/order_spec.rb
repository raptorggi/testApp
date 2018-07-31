require 'rails_helper'

feature 'order', type: :feature do
  let(:category) { create :category }
  let(:product) { create :product, category_id: category.id }
  let(:user) { create :user }
  let(:user_admin) { create :admin_user }

  before do
    user
    user_admin
  end

  scenario 'show order page and create order', js: true do
    visit new_user_session_path
    fill_in 'Эл. адрес', with: user.email
    fill_in 'Пароль', with: 'password'
    click_button 'Войти'
    visit show_product_path(category_slug: category.slug, slug: product.slug)
    click_button 'Купить'
    click_button 'Корзина'
    expect(page).to have_text 'Корзина'
    click_button 'Оформить заказ'
    expect(page).to have_text 'Оформление заказа'
    fill_in 'Адрес', with: 'selo kukuevo'
    click_button 'Оформить заказ'
    expect(page).to have_text 'Спасибо за покупку!'
    expect(Order.find_by(name: user.name).last_name).to eq('test')
  end
end
