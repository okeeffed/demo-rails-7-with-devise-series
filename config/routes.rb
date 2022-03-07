Rails.application.routes.draw do
  get 'session/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :session, only: [:index]
  resources :home, only: %i[index create]
  
  # Defines the root path route ("/")
  root 'home#index'
end
