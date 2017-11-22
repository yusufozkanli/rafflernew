Rails.application.routes.draw do
  devise_for :users
  root to: 'raffles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :raffles do
    resources :orders, only: [:new, :create]
  end
  resources :users, only: [ :show, :update, :edit ]

  get '/pages/confirmation', to: 'pages#confirmation'
end
