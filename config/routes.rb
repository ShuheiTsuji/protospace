Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users, only: [:show, :edit, :update] do
    resources :products do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
end

