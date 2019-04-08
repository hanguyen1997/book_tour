Rails.application.routes.draw do

  root 'bookings#home'
  get 'home', to:'bookings#home'
  get 'detail', to:'bookings#detail'
  get 'domestic', to:'bookings#more_domestic'
  get 'international', to:'bookings#more_international'
  get '404', to:'public#404'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
