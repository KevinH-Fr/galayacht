class EspaceBailleurController < ApplicationController
  def index
    bailleur = Bailleur.where(user_id: current_user).first
    @produits = bailleur.produits
  end
end
