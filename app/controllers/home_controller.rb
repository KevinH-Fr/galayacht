class HomeController < ApplicationController
  def index
    @q = Produit.ransack(params[:q])
    @produits = @q.result(distinct: true)
  end

  def testimage
    
  end
end
