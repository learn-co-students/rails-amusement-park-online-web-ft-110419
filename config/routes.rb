Rails.application.routes.draw do
  resources :users
  # resources :sessions
  resources :attractions

  # get '/signup' => 'users#new'
  # post '/signup' => 'users#create'

  root to: "users#index"
 
  # get '/users/new' => 'users#new'
  # post '/users' => 'users#create'
  # get '/users/:id' => 'users#show'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  # get '/welcome' => 'users#index'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
end
