Rails.application.routes.draw do
  resources :tour_cities

  resources :tour_guides

  devise_for :users
  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"
  get "welcome/faq"
  
  resources :tours

  root to: 'tours#index'
  
end
