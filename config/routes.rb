Rails.application.routes.draw do
  get 'login/index'
  resources :users, only: [:index, :show] do
    resources :posts
  end
  resources :login
end
