module ReservationsHelper
    def num_resa(reservation) 
        "#{reservation.created_at.strftime("%Y%m%d%H%M%S")}#{reservation.id}"
    end

    def produit_img(reservation)
        Produit.find(reservation).image1
    end
end
