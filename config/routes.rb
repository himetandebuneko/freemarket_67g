Rails.application.routes.draw do
  root to: 'products#index'
  resources :products, only: [:show]
  resources :users, only: [:index]
end
