Rails.application.routes.draw do
  root 'devise/sessions#new'
  devise_for :users
  resources :login
  resources :users
  resources :users, only: [:show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
