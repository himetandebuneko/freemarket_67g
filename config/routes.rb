Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products do 
    collection do
      get 'category_children', defaults: { format: 'json' } 
      get 'category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users, only: [:index, :new, :create, :show]
  get       '/products/confirm/:id', to: 'products#confirm'
  resources :credits, only: [:new, :create, :show] do
    member do
      post 'delete', to: 'credits#delete'
      post 'pay', to: 'credits#pay'
      get 'done', to: 'credits#done'
    end
  end
end
