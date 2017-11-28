Rails.application.routes.draw do
  devise_for :users
  root to: 'raffles#index'
  get '/browse' , to: 'raffles#browse'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :raffles do
    resources :orders, only: [:new, :create,] do
      get '/confirmation', to: 'orders#confirmation'
      get '/winner', to: 'orders#winner'
    end
  end

  resources :commands, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end


  resources :users, only: [ :show, :update, :edit ]
end
