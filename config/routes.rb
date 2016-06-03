Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users, only: [:show, :edit, :update]

  namespace :product do
    resources :popular, only: :index
  end

  resources :products do
    resources :likes,    only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :tags, only: [:index, :show]
end
