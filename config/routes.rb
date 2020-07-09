Rails.application.routes.draw do
  
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/profile', to: 'users#profile'

  resources :users

  resources :issues
  resources :mechanics
  resources :mechanic_sessions


  resources :vehicles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
