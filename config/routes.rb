Rails.application.routes.draw do
  get 'documents/index'
  get 'documents/create'
  get 'documents/update'
  get 'documents/destroy'
  get 'session/index'
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions',
                            registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :session, only: [:index]
  resources :home, only: %i[index create]

  # Defines the root path route ("/")
  root 'home#index'
end
