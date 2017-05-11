Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes
  resources :passengers
  resources :tickets
  resources :carriages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
