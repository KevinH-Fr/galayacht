class EspacePreneurController < ApplicationController
  def index
    @produits = Produit.limit(6)
    @destinations = Destination.all
  end
end
