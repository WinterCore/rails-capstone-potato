Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles, only: [:index, :new, :create] do
    post 'vote', to: 'articles#vote'
  end

  root 'home#index'
end
