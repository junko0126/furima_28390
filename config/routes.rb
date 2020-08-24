Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only: [:index, :new, :edit, :create, :show]
  resources :orders, only: [:index, :new, :create]
end
