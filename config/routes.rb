Rails.application.routes.draw do
  resources :login
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  root "users#index"
end
