Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#home"
  resources :users
  resources :rides
  resources :attractions
  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
end
