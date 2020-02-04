Rails.application.routes.draw do
  root to: 'products#index'
  resources :users, only: :index
end
