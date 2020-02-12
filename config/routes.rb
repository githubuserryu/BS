Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  root "main#index"
  get '/main/cost_new', to: 'main#cost_new'
  post '/main/cost_new', to: 'main#cost_create'
  resources :main, only: [:index, :new, :create, :show]
  get '/main/show/income_edit', to: 'main#income_edit'
  get '/main/show/spend_edit', to: 'main#spend_edit'
  get '/main/show/cost_income_edit', to: 'main#cost_income_edit'
  get '/main/show/cost_spend_edit', to: 'main#cost_spend_edit'
  patch '/main/show/income_edit', to: 'main#income_update'
  patch '/main/show/spend_edit', to: 'main#spend_update'
  patch '/main/show/cost_income_edit', to: 'main#cost_income_update'
  patch '/main/show/cost_spend_edit', to: 'main#cost_spend_update'
  delete '/main/show/income_destroy', to: 'main#income_destroy'
  delete '/main/show/spend_destroy', to: 'main#spend_destroy'
  delete '/main/show/cost_income_destroy', to: 'main#cost_income_destroy'
  delete '/main/show/cost_spend_destroy', to: 'main#cost_spend_destroy'
end

