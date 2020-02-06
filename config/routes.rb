Rails.application.routes.draw do
  root to: 'products#index'

  resources :products, only: [:show, :new] 
  resources :users, only: [:index, :new, :create, :show]
end
