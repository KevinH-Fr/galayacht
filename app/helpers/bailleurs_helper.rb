module BailleursHelper
    def produits_bailleur_courant
       bailleur = Bailleur.where(user_id: current_user).first
       bailleur.produits
    end

    def produits_count 
        produits_bailleur_courant.count
    end

    def reservations_bailleur_courant
        Reservation.where(produit_id: produits_bailleur_courant.pluck(:id))
    end

    def reservations_count 
        reservations_bailleur_courant.count
    end

    def reservations_val 
        reservations_bailleur_courant.sum(:prix)
    end

    def reservations_cloturees
        reservations_bailleur_courant.count
    end

    def reservations_avenir
        reservations_bailleur_courant.count
    end

    def groupByDateTotal
        reservations_bailleur_courant.group('DATE(debutlocation)').sum('prix')
    end

end
