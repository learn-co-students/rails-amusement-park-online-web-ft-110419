Rails.application.routes.draw do
	root to: 'sessions#welcome'
	resources :users
	resources :attractions
	resources :rides, only: [:index, :create, :new, :show, :delete]
	get 'signin' => 'sessions#new'
	post 'signin' => 'sessions#create'
	get 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
