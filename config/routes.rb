Rails.application.routes.draw do
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

  resources :users, only: [:new, :create, :index]
  
  resources  :sessions, only: [:new, :create, :destroy]
  get 'vk_callback' => 'sessions#vk_callback' 

  namespace :admin do
    resources :feedbacks, :pages, :users
    root 'application#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end