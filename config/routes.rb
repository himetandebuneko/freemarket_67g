Rails.application.routes.draw do
 
  root to: 'products#index'
  devise_for :users
  resources :products
  resources :users, only: [:index, :new, :create, :show]
  get       '/products/confirm/:id', to: 'products#confirm'
end
