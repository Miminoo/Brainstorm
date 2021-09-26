Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks
  resources :tags, only: [:show]
end
