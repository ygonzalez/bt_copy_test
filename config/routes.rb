BuildingTrades::Application.routes.draw do
  

  devise_for :users, :skip => [:registrations] 
  resources :managers, only: [:index, :show]
  resources :custodians, only: [:index, :show]
  resources :companies, only: [:index, :show]
  resources :consultants, only: [:index, :show]
  resources :trades, only: [:index, :show]
  resources :plans, only: [:index, :show] do
    resources :contacts
  end


  devise_scope :user do
    root to: "trades#index" 
  end

  unauthenticated do
    root to: "sessions#new", :as => "unauthenticated"
  end

end