Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get   'users/:id'   =>  'users#show'
  resources :prototypes, only: [:index, :new, :show]
end

