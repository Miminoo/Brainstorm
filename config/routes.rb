Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    root 'tasks#index'
    resources :tasks do
      resources :taskuseranswers
      resources :ratings
    end
    resources :tags, only: [:show]
    get "search", to: "search#search"
  end
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
end
