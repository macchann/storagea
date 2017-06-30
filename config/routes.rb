Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  get 'items/search' => 'items#search'
  get 'items/result' => 'items#result'
  get 'items/searchm' => 'items#searchm'
  get 'items/resultm' => 'items#resultm'
  resources :items, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :items do
    resources :comments, only: [:create, :destroy]
  end
  get '/users/favorite' => 'users#favorite', as: 'favorite'
  resources :users, only: [:show, :edit, :update]
  resources :brands, only: [:new, :create]

  post   '/like/:item_id' => 'likes#like',   as: 'like'
  delete '/like/:item_id' => 'likes#unlike', as: 'unlike'

end