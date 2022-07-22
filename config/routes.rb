Rails.application.routes.draw do
  get 'login/index'
  resources :users
  resources :posts
  resources :login
end
