Rails.application.routes.draw do

  
  #SESSION / Signup
  get '/users/new' => 'sessions#new' 
  post '/users' => 'sessions#create'
  delete '/users' => 'sessions#destroy'
  post '/signin' => 'sessions#login'

  #RIDE 

  
  resources :attractions, only: [:show] do
    resources :rides, only: [:show,:create,:new]   
  end
  resources :rides, only: [:create,:new]

  get 'rides/new'
  # SIGNING 
  get '/signin' => 'users#signin'
  # post '/signin' => 'users#login'

  #USER
  get '--/users/:id' => 'users#show', as: 'user'

  #Attractions
  resources :attractions, only: [:index, :new, :show, :create,:edit, :update]

  #STATIC
  root 'statics#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
