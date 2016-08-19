Rails.application.routes.draw do

  namespace :admin do
    resources :users do
      collection do 
        put :unimpersonate
      end 
      member do 
        post :impersonate
      end 
    end 
  end
  resources :movies do
    resources :reviews, only: [:new, :create]
  end 
  resources :users , only: [:new, :create, :show] 

  resource :sessions, only: [:new, :create, :destroy] 

  root to: 'movies#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
