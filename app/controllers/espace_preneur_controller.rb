class EspacePreneurController < ApplicationController
  def index
    @destinations = Destination.all

    @q = Produit.actif.ransack(params[:q])

    if params[:city].present?
      destination = params[:city].titleize
      @produits = Produit.actif.where(destination_id: destination)
      @pagy, @produits = pagy(@produits, items: 5)

    else
      
      @q = Produit.actif.ransack(params[:q])
      @produits = @q.result(distinct: true).order(created_at: :desc)
      @pagy, @produits = pagy(@produits, items: 5)
    end

  end
end
