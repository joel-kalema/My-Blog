Rails.application.routes.draw do
  get '/users/:id', to: 'users#show'
  resources :users do
    resources :posts, only: %i[index show]
  end
  resources :login
end
