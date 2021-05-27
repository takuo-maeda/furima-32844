Rails.application.routes.draw do
  get 'products/index'
  get 'products/search'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index, :create, :edit, :update]
    collection do
      get 'search'
    end
  end
  resources :cards, only: [:new, :create, :show, :destroy]
end


