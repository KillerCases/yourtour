Rails.application.routes.draw do
  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"
  get "welcome/faq"
  
  resources :tours

  root to: 'tours#index'
  
end
