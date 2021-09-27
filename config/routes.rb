Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks
  resources :tags, only: [:show]
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
end
