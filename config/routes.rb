Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users,
  :path => 'user',
  :path_names => {
    :sign_in => 'login',
    :sign_out => 'logout',
    :password => 'secret',
    :registration => 'register',
    :sign_up => 'cmon_let_me_in',
    :profile => 'profile'},
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  ActiveAdmin.routes(self)

  root 'application#index'
  get 'about' => 'application#about'
  get 'index' => 'application#index'

  get 'feedbacks' => 'feedbacks#new', as: :new_feedback
  post 'feedbacks' => 'feedbacks#create'

  get 'page/:slug' => 'page#show', as: :show_page

  get 'products/index' => 'products#index'
  get 'products/:slug' => 'products#category', as: :show_category
  get 'products/:category_slug/:slug' => 'products#show', as: :show_product
  post 'products/:slug/buy' => 'products#buy', as: :add_product_to_cart

  get 'cart' => 'cart#cart', as: :show_cart

  get 'order' => 'orders#order'
  post 'order' => 'orders#create', as: :create_order
  get 'confirmed' => 'orders#confirmed', as: :confirmed_order

end
