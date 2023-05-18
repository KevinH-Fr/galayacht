Rails.application.routes.draw do

  get 'home/index'
  get 'home/testimage'
  root "home#index"
  get 'espace_permis/index'

  get 'espace_bailleur/index'
  get 'espace_preneur/index'
  get 'espace_admin/index'
 
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/show'
  get 'users/:id' => 'users#show', as: 'user'

  resources :destinations
  resources :bailleurs
  resources :preneurs
  resources :admin_parameters

  resources :produits do
    member do
      post :edit
    end
  end

  resources :occupations do
    member do
      post :edit
    end
  end

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
