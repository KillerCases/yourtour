Rails.application.routes.draw do

  resources :bookings
  
  resources :charges

  resources :calendars

  resources :tour_prices

  resources :tour_cities

  resources :tour_guides

  devise_for :users, :path_prefix => 'my', :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users
  # This must go after devise_for to avoid conflicts
  
  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"
  get "welcome/faq"
  get "welcome/admin"
  get "welcome/your_bookings"
  
  resources :tours do 
    collection { post :import}
  end

  root to: 'welcome#index'
  
end
