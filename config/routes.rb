Rails.application.routes.draw do
  get 'espace_bailleur/index'
  get 'espace_preneur/index'
  resources :produits
  resources :bailleurs
  resources :preneurs
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
end
