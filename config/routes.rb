Rails.application.routes.draw do
  get 'evenement/index'
  
  get 'home/index'
  get 'home/indexdesign2'


  get "blog/index"

  get 'home/mentions_legales'
  get 'home/nous_connaitre'
  get 'home/politique_confidentialite'
  
  get 'home/testimage'
  root "home#index"
  get 'espace_permis/index'
  
  get 'espace_bailleur/index'
  get 'espace_preneur/index'
  get 'espace_admin/index'

  get 'produits/archive', to: 'produits#archive', as: 'archive_produits'
  post 'produits/:id/activate', to: 'produits#activate', as: 'activate_produit'
  post 'produits/:id/archivate', to: 'produits#archivate', as: 'archivate_produit'
  get '/produits/:id/fullscreen', to: 'produits#fullscreen', as: 'produit_fullscreen'
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/show'
  get 'users/:id' => 'users#show', as: 'user'
  
  resources :destinations
  resources :bailleurs
  resources :preneurs
  resources :admin_parameters
  resources :demandes
  


  resources :produits do
    member do
     # post :edit
      get :edition
      get :delete_image1_attachment
    #  get 'delete_media_attachment/:media_id', action: :delete_media_attachment, as: :delete_media_attachment
      get 'delete_media_attachment', to: 'produits#delete_media_attachment', as: :delete_media_attachment
 
    end
  end

  resources :occupations do
    member do
      post :edit
    end
  end

  resources :schedules do
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
