class EspacePreneurController < ApplicationController
  def index
    @produits = Produit.all
    @destinations = Destination.all
  end
end
