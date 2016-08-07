Rails.application.routes.draw do

  root to: "welcome#index"


  #resources :users
  resources :users, only: [:index, :show, :new, :create]
  namespace :admin do
    get 'base/index'

    resources :authors

    resources :publishers

    resources :books

  end

  get '/sign_up', to: 'users#new', as: 'sign_up'
  get '/sign_in', to: "sessions#new", as: "sign_in"
  post '/sign_in', to: "sessions#create"
  get 'reset_password', to: 'password_resets#new'

  resource :session
  resources :catalogs, only: [:index, :show]
  resources :carts, only: [:show, :destroy]
  resources :cart_items, only: [:create]
  resources :orders, only: [:new, :create]
  resources :password_resets, only: [:create]

end
