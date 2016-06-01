Rails.application.routes.draw do
  root 'static_pages#profile'

  get '/profile', to: 'static_pages#profile'
  get '/welcome', to: 'static_pages#welcome'
  get 'homes/search'
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get 'all_homes', to: 'homes#index_all'

  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'
  post 'homes/search_results'
  post '/dislike', to: 'dislikes#create'
  
	delete '/logout', to: 'sessions#destroy'  

  resources :users do
    resources :homes
  end

  resources :addresses
end
