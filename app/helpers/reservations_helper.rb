module ReservationsHelper
    def num_resa(reservation) 
        "#{reservation.created_at.strftime("%Y%m%d%H%M%S")}#{reservation.id}"
    end

    def produit_img(reservation)
        produit = Reservation.find(reservation).produit_id
        Produit.find(produit).image1
    end
end
