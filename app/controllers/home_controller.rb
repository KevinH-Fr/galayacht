class HomeController < ApplicationController
  
  def index
    @q = Produit.ransack(params[:q])
    @produits = @q.result(distinct: true)
    @destinations = Destination.all
  end

  def indexdesign2
    
  end

  def mentions_legales
  end

  def nous_connaitre
  end

  def politique_confidentialite
  end

end
