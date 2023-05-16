Rails.application.routes.draw do
  get 'users/show'

 #devise_for :users

 devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'users/:id' => 'users#show', as: 'user'

  
  resources :destinations
  get 'espace_bailleur/index'
  get 'espace_preneur/index'
  get 'espace_admin/index'
  resources :produits
  resources :bailleurs
  resources :preneurs
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"


   resources :reservations do
    member do
      get :edition
      get :edition_test

      get :send_reservation_email_preneur, 
          to: 'reservations#send_reservation_email_preneur', 
          as: :send_reservation_email_preneur

      get :send_reservation_email_bailleur, 
          to: 'reservations#send_reservation_email_bailleur', 
          as: :send_reservation_email_bailleur

    end
   end

end
