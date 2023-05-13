Rails.application.routes.draw do
  root 'gossips#index'
  get 'contact', to: 'pages#contact'
  get 'team', to: 'pages#team'

  resources :users, only: [:new, :create]
  resources :cities, only: [:index, :new, :create]
  resources :gossips, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  #namespace :sessions do
    #resources :users, only: [:new, :destroy, :edit, :update, :create]
  #end
end
