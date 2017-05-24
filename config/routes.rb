Rails.application.routes.draw do
  resources :trains do
    resources :carriages
  end
  
  resources :routes
  resources :passengers
  resources :tickets
  

  resources :railway_stations do
    put 'update_station', on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
