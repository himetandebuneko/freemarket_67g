Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products
  resources :users, only: [:index, :new, :create, :show]
  get       '/products/confirm/:id', to: 'products#confirm'
  resources :credits, only: [:new, :create, :show, :edit, :destroy]
end
