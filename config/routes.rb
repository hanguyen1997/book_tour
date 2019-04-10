Rails.application.routes.draw do
	
  root 'home_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '404', to:'public#404'
  
  resources :tours
end
