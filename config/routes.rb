Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
  root       'products#index'
  resources  :users   , only: [:show, :edit, :update] do
  resources  :products, only: [:new, :create, :index]
  end
=======
  root 'products#index'
  resources :users , only: [:show, :edit, :update]
  resources :products, only: [:new, :create, :index]
>>>>>>> parent of 54e3e5f... create controller function and index.html.haml
end

