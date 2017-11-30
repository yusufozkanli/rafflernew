Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  root to: 'raffles#index'
  get '/browse' , to: 'raffles#browse'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :raffles do
    resources :orders, only: [:new, :create,] do
      get '/confirmation', to: 'orders#confirmation'
      get '/winner', to: 'orders#winner'
    end
  end

  resources :commands, only: [] do
    resources :payments, only: [:new, :create]
  end

  get "/commands/:id", to: "commands#show", as: :commands
  get "/commands/:order_id", to: "commands#create_command", as: :commands_create


  resources :users, only: [ :show, :update, :edit ]
end
