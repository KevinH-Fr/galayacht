class EspaceBailleurController < ApplicationController
  def index
    @produits = Produit.all # ajouter filtre sur current user bailleur lié
  end
end
