class ReservationMailer < ApplicationMailer
    helper :reservations

    # mail au preneur
    def reservation_created_preneur(reservation)
        @reservation = Reservation.find(reservation)
        preneur = @reservation.preneur_id
        preneurMail = Preneur.find(preneur).mail

        @texteBase = "Merci de trouver ci-attaché votre bon de réservation
         pour la location du #{@reservation.debutlocation} au #{@reservation.finlocation}""."
        resa_name = reservation

        mail(
            to: preneurMail,
            subject: "Reservation confirmee ##{resa_name}", 
            cc: "kevin.hoffman.france@gmail.com"
        )
    end

    def reservation_created_bailleur(reservation)
        @reservation = Reservation.find(reservation)
        bailleur = Produit.find(@reservation.produit_id).bailleur_id
        bailleurMail = Bailleur.find(bailleur).mail

        @texteBase = "Merci de trouver ci-attaché votre bon de réservation
         pour la location du #{@reservation.debutlocation} au #{@reservation.finlocation}""."
        resa_name = reservation

        mail(
            to: bailleurMail,
            subject: "Reservation confirmee ##{resa_name}", 
            cc: "kevin.hoffman.france@gmail.com"
        )
    end
  
end
  