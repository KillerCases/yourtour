Rails.application.routes.draw do
  devise_for :users
  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"
  get "welcome/faq"
  
  resources :tours

  root to: 'tours#index'
  
end
