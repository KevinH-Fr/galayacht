module ProduitsHelper

    def produit_courant
        if params[:produitId].present?
            produitId = params[:produitId]
        else 
            produitId = Reservation.find(params[:id]).produit_id
        end
        Produit.find(produitId) if produitId.present?
    end

    def bailleur_produit_courant(produit)
        Produit.find(produit).bailleur_id
    end

    def produit_full_name(produit)
        "#{Produit.find(produit).nom} #{Produit.find(produit).type_produit}"
    end
end
