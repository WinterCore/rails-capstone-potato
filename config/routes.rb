Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :articles, onlky: [:index, :new, :create]

  root 'home#index'
end
