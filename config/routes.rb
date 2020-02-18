Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :signup, only: [:new, :create] do
    collection do
      post 'step'  #入力が全て完了
      get 'complete_signup'  #登録完了後
    end
  end
  resources :products do 
    collection do
      get 'category_children', defaults: { format: 'json' } 
      get 'category_grandchildren', defaults: { format: 'json' }
    end
    member do
      get 'confirm'
    end
  end
  resources :users, only: [:index, :show]
  resources :credits, only: [:new, :create, :show] do
    member do
      post 'delete', to: 'credits#delete'
      post 'pay', to: 'credits#pay'
      get 'done', to: 'credits#done'
    end
  end
end
