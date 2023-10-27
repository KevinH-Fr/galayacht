class EspaceAdminController < ApplicationController
  include UserHelper
  before_action :authenticate_admin!
  
  def index
    @admins = User.where(role: 1)
    @users = User.all
    @bailleurs = Bailleur.limit(5)
    @preneurs = Preneur.limit(5)
    @produits = Produit.limit(5)
    @reservations = Reservation.limit(5)
    @destinations = Destination.limit(5)
    
    @demandes = Demande.limit(5)
    @contrats = Contrat.limit(5)


  end

  private
  
  def authenticate_admin!
    unless current_user && current_user.admin?
      redirect_to root_path, alert: "Vous n'avez pas accès à cette page."
    end
  end

end
