Rails.application.routes.draw do
  devise_for :users
  # devise_scope :user do
  #   root :to => "devise/sessions#new"
  # end
  root "main#index"
  resources :main, only: [:index, :new, :create,]
  resources :events, only: [:index, :show, :new, :update, :destroy]
  resources :income, only: :index
end
