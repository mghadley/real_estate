Rails.application.routes.draw do
  root 'sellers#index'
  
  resources :sellers do
    resources :homes
  end

  resources :addresses

  get 'homes/search'

  post 'homes/search_results'

end
