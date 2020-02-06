Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  root "main#index"
  resources :main, only: [:index, :new, :create, :show]
  get '/main/show/income_edit', to: 'main#income_edit'
  get '/main/show/spend_edit', to: 'main#spend_edit'
  patch '/main/show/income_edit', to: 'main#income_update'
  patch '/main/show/spend_edit', to: 'main#spend_update'
  delete '/main/show/income_destroy', to: 'main#income_destroy'
  delete '/main/show/spend_destroy', to: 'main#spend_destroy'
  resources :events, only: [:index, :show, :new, :update, :destroy]
  resources :income, only: :index
end

