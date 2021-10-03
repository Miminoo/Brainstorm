Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'tasks#index'
  resources :tasks do
    resources :taskuseranswers
    resources :ratings
  end
  resources :tags, only: [:show]
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
end
