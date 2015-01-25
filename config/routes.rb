Rails.application.routes.draw do
  get 'welcoe/index'

  get 'welcoe/about'

  get 'welcoe/contact'

  get 'welcoe/faqs'

  resources :tours

  root to: 'tours#index'
  
end
