Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks do
    resources :taskuseranswers
    resources :ratings
  end
  resources :tags, only: [:show]
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
end
