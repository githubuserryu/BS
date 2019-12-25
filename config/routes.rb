Rails.application.routes.draw do
  root "events#index"
  resources :events, only: [:index, :show, :new, :update, :destroy]
  resources :income, only: :index
end
