Rails.application.routes.draw do

  root to: "welcome#index"

  resources :authors

  resources :publishers

  resources :books

  resources :users

  get '/sign_up', to: 'users#new', as: 'sign_up'
  get '/sign_in', to: "sessions#new", as: "sign_in"
  post '/sign_in', to: "sessions#create"

end
