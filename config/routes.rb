Rails.application.routes.draw do

  root to: "welcome#index"


  resources :users

  namespace :admin do
    get 'base/index'

    resources :authors

    resources :publishers

    resources :books

  end

  get '/sign_up', to: 'users#new', as: 'sign_up'
  get '/sign_in', to: "sessions#new", as: "sign_in"
  post '/sign_in', to: "sessions#create"

  resource :session

  resources :catalogs, only: [:index, :show]

  resources :carts, only: [:show, :destroy]

  resources :cart_items, only: [:create]

  resources :orders, only: [:new]

end
