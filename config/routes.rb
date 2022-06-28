Rails.application.routes.draw do
  devise_for :users
  # resources :transactions, controller: :expenditures, as: :transactions
  resources :expenditures, path: '/transactions'
  resources :groups
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#index"
end
