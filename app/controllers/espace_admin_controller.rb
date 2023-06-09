class EspaceAdminController < ApplicationController
  include UserHelper
  before_action :authenticate_admin!
  
  def index
    @admins = User.where(role: 1)
    @users = User.all
    @bailleurs = Bailleur.limit(5)
    @preneurs = Preneur.limit(5)
    @produits = Produit.limit(5)
    @reservations = Reservation.all
    @demandes = Demande.all


  end

  private
  
  def authenticate_admin!
    unless current_user && current_user.admin?
      redirect_to root_path, alert: "Vous n'avez pas accès à cette page."
    end
  end

end
