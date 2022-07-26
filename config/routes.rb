Rails.application.routes.draw do
  get 'likes/new'
  root 'users#index'
  resources :login
  resources :users do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: %i[new create]
    end
  end
end
