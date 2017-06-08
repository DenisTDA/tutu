Rails.application.routes.draw do
  
  devise_for :users
  
  resources :trains do
    resources :carriages, shallow: true 
  end

  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end
  resources :routes
  resources :users
  resources :tickets
  resource :search, only: [:create, :show, :edit] 

  get 'tutu/index'
  root 'tutu#index'
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
