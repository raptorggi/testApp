Rails.application.routes.draw do
  get 'about' => 'application#about'
  get 'index' => 'application#index'
  get 'feedbacks' => 'feedbacks#new', as: :new_feedback
  post 'feedbacks' => 'feedbacks#create'
  root 'application#index'
  get 'page/:slug' => 'page#show', as: :show_page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
