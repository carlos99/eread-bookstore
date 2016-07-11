Rails.application.routes.draw do

  root to: "welcome#index"

  resources :authors

  resources :publishers

  resources :books

  resources :users

end
