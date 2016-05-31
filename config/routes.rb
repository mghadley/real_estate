Rails.application.routes.draw do
  root 'static_pages#profile'

  get '/profile', to: 'static_pages#profile'
  get '/welcome', to: 'static_pages#welcome'
  get 'homes/search'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'

  post '/login', to: 'sessions#create'
  post '/sing_up', to: 'users#create'
  post 'homes/search_results'
  
	delete '/logout', to: 'sessions#destroy'  

  resources :users do
    resources :homes
  end

  resources :addresses
end
