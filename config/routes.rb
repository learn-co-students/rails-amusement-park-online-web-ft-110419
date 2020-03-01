Rails.application.routes.draw do
  root 'users#new'
  get '/signin' => 'sessions#new', as: 'login'
  post '/signin' => "sessions#create"

  get '/logout', to: "users#destroy", as: 'logout'
  resources :attractions
  resources :rides
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
