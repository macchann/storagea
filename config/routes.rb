Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  get 'items/search' => 'items#search'
    get 'items/result' => 'items#result'
  resources :items, only: [:show, :new, :create]
  resources :users, only: [:show, :edit, :update]
  resources :brands, only: [:new, :create]
end
