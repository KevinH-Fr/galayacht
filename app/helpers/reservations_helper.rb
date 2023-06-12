module ReservationsHelper
    def num_resa(reservation) 
        "#{reservation.created_at.strftime("%Y%m%d%H%M%S")}#{reservation.id}"
    end

    def produit_img(reservation)
        produit = Reservation.find(reservation).produit_id
        Produit.find(produit).image1
    end

    def produit_destination(produit)
        destination = Produit.find(produit).destination_id
        Destination.find(destination).full_name
    end

    def total_remuneration
        Reservation.all.sum(:remuneration)
    end
end
