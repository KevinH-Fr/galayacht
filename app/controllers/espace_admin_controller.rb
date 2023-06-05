class EspaceAdminController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @admins = User.where(role: 1)
    @users = User.all
    @bailleurs = Bailleur.all
    @preneurs = Preneur.all
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
