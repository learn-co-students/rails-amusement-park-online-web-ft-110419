Rails.application.routes.draw do
  # get '/users/new', to: 'users/new', as: 'signup'
  root :to => 'welcome#home'
  get '/signin', to: 'sessions#signin'
  post '/signin', to: 'sessions#create'
  resources :users
  resources :attractions
  resources :rides
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
