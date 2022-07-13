Rails.application.routes.draw do
  resources :likes
  resources :posts
  resources :comments
  resources :users

  root 'articles#home'
  get "articles/index"
  get "articles/home_p"
end
