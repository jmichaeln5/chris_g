Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users

  # get 'search/index'
  # get 'search/results'

  resources :search, only: [:index] do
    collection do
      get 'results'
    end
  end

  # resources :orders
  # resources :purchasers

  resources :users do
    resources :purchasers, shallow: true
  end

  # resources :purchasers do
  #   resources :orders, shallow: true
  # end

  resources :purchasers do          # Shallow
    resources :orders, only: [:index, :new, :create]
  end
  resources :orders, only: [:show, :edit, :update, :destroy]

  get 'all_orders', to: 'orders#all_orders'


  get '/test' => 'pages#test_page'
  # get 'users/dashboard'
  get '/dashboard' => 'users#dashboard'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
