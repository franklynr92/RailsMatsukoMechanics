Rails.application.routes.draw do
  
  root 'sessions#home'  
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'exit', to: 'sessions#destroy', as: :logout
  
  #get '/profile', to: 'users#profile' 
  #get '/mechanic/profile' to: 'mechanics#profile'

  resources :users do

    resources :vehicles

  end


  resources :vehicles do

    resources :issues

  end

  



 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
