Rails.application.routes.draw do

  
  #SESSION / Signup
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  delete '/users' => 'sessions#destroy'
  post '/signup' => 'users#create'
  post '/signin' => 'sessions#create'
  get '/signin' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'
  #RIDE 

  
  # resources :attractions, only: [:show] do
  #   resources :rides, only: [:show,:create,:new]   
  # end
  # resources :rides, only: [:new]
  
  post '/rides', to:"rides#create", as: 'rides'
  # SIGNING 
  # post '/signin' => 'users#login'

  #USER
  get '/users/:id' => 'users#show', as: 'user'
  
  #Attractions
  
  resources :attractions, only: [ :index, :new, :show, :create,:edit, :update]

  #STATIC
  root 'statics#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
