
Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'gossips#index'
  get 'contact', to: 'pages#contact'
  get 'team', to: 'pages#team'
    # Defines the root path route ("/")
    # root "articles#index"
  resources :users, only: [:new, :create]
  resources :cities, only: [:index, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :gossips, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
