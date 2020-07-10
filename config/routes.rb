Rails.application.routes.draw do
  
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'admin/home', to: 'mechanic_admin#home'
  get 'admin/orders', to: 'mechanic_admin#orders'
  get 'admin/invoice', to: 'mechanic_admin#invoice'
  
  get '/profile', to: 'users#profile' 
  #get '/mechanic/profile' to: 'mechanics#profile'

  resources :users

  resources :issues
  resources :mechanics
  


  resources :vehicles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
