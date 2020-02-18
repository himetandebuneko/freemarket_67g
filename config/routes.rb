Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :signup, only: [:new, :create] do
    collection do
      post 'step'  #入力が全て完了
      get 'complete_signup'  #登録完了後
    end
  end
  resources :products, only: [:show, :new] 
  get       '/products/confirm/:id', to: 'products#confirm'
end