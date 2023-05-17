class HomeController < ApplicationController
  def index
    @q = Produit.ransack(params[:q])
    @produits = @q.result(distinct: true)
    @destinations = Destination.all

  end

  def testimage
    
  end
end
