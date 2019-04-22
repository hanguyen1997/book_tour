Rails.application.routes.draw do
	
  root 'home_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get "/history", to: "histories#index"
  get '404', to:'public#404'
  
  resources :tours
  resources :users
  resources :bookings

  namespace :admin do
    root "dashboard#index"
    resources :categories
    resources :users
    resources :tours
    resources :comments
  end
end
