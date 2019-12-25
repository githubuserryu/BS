Rails.application.routes.draw do
  devise_for :users
  root "main#index"
  resources :main, only: :index
  resources :events, only: [:index, :show, :new, :update, :destroy]
  resources :income, only: :index
end
