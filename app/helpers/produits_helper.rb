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

    def prix_fai_jour_basse_saison(produit)
        if produit.prixjour 
            remuneration = AdminParameter.first&.remuneration || 0
            calculated_price =  number_to_currency(produit.prixjour * (1 + remuneration.to_f / 100), locale: :fr)  
        end
    end

    def prix_fai_semaine_basse_saison(produit)
        if produit.prixsemaine
            remuneration = AdminParameter.first&.remuneration || 0
            calculated_price =  number_to_currency(produit.prixsemaine * (1 + remuneration.to_f / 100), locale: :fr)
        end
    end

    def reservations_existantes(produit) 
        # verifier si resa existent, 
        reservations = Reservation.where(produit_id: produit).present?
    end
end
