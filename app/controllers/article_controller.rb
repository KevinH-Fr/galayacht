class ArticleController < ApplicationController
  def location_bateau_cannes
    @produits = Produit.actif.limit(6)
  end

  def location_bateau_mandelieu
    @produits = Produit.actif.limit(6)
  end

  def location_bateau_antibes
    @produits = Produit.actif.limit(6)
  end

  def organisation_evenements
    @produits = Produit.actif.limit(6)
  end

end
