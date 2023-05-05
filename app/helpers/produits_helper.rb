module ProduitsHelper

    def produit_courant
        produitId = params[:produitId]
        Produit.find(produitId)
    end

    def bailleur_produit_courant(produit)
        Produit.find(produit).bailleur_id
    end

    def produit_full_name(produit)
        "#{Produit.find(produit).nom} #{Produit.find(produit).type_produit}"
    end
end
