Rails.application.routes.draw do
  devise_for :users
    root to: "items#index"

# resources :routes, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :items do
    resources :trades, only: [:new, :create, :edit, :accept, :destroy]
  end
  resources :trades, only: [:destroy, :update]
  get '/dashboard', to: "items#dashboard"

end
