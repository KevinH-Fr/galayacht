class EspacePreneurController < ApplicationController
  def index
    @produits = Produit.all
  end
end
