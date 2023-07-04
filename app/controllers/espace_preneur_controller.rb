class EspacePreneurController < ApplicationController
  def index
    @produits = Produit.actif.limit(6)
    @destinations = Destination.all
  end
end
