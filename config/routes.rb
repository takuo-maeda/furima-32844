Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index, :create, :edit, :update]
    collection do
      get 'search'
    end
  end
  resources :cards, only: [:new, :create, :show, :destroy]
  get 'products/index'
  get 'products/search'
end


