Rails.application.routes.draw do

  root 'home_pages#home'
  get '404', to:'public#404'
  
  resources :tours
end
