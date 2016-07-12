Rails.application.routes.draw do

  root to: "welcome#index"

  resources :authors

  resources :publishers

  resources :books

  resources :users

  get '/signin', to: "sessions#new", as: "signin"
  post '/signin', to: "sessions#create"

end
