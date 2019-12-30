Rails.application.routes.draw do
  devise_for :users
  root "main#index"
  resources :main, only: [:index, :new, :create, :show]
  resources :events, only: [:index, :show, :new, :update, :destroy]
  resources :income, only: :index
end
