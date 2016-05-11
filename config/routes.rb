Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users , only: [:show, :edit, :update] do
  resources :products, only: [:new, :create, :index]
end
end

