Rails.application.routes.draw do
  resources :bookings

  resources :calendars

  resources :tour_prices

  resources :tour_cities

  resources :tour_guides

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"
  get "welcome/faq"
  get "welcome/admin"
  
  resources :tours do 
    collection { post :import}
  end

  root to: 'welcome#index'
  
end
