Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :users, only: [:new, :crearte, :destroy]
  resources :items, only: [:index, :new]
end


