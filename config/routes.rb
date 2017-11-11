Rails.application.routes.draw do
  root 'application#index'
  get 'about' => 'application#about'
  get 'index' => 'application#index'
  get 'feedbacks' => 'feedbacks#new', as: :new_feedback
  post 'feedbacks' => 'feedbacks#create'
  get 'page/:slug' => 'page#show', as: :show_page
  resources :users, only: [:new, :create, :index]
  resources  :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end