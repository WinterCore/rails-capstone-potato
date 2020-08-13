Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  # This is done to prevent the browser from sending a get request to the /users route which doesn't exist
  # Which causes the browser to render a 404 page
  get '/users', to: redirect('/users/new')

  resources :sessions, only: [:new, :create]
  delete 'sessions', to: 'sessions#destroy'

  resources :articles, only: [:index, :new, :create, :show] do
    resources :votes, only: [:create]
    resources :comments, only: [:create]
  end

  root 'home#index'
end
