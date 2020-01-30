Rails.application.routes.draw do
  # resources :users
  # resources :sessions

  # get '/signup' => 'users#new'
  # post '/signup' => 'users#create'

  root to: "users#index"
 
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/users/new' => 'users#new'




  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  # get '/welcome' => 'users#index'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
end
