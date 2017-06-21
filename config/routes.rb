Rails.application.routes.draw do
  
  devise_for :users
  scope "/admin" do
    resources :users
  end
 
  resources :tickets
  resource :search, only: [:create, :show, :edit] 

  namespace :admin do
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end

    resources :trains do
      resources :carriages, shallow: true 
    end

    resources :routes
    resources :users
    resources :tickets
    resource :dashboard, only: [:show]
  end 
  get 'searches/show'
  root 'searches#show'
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
