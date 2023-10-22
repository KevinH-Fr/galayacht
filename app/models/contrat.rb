class Contrat < ApplicationRecord
    belongs_to :reservation, optional: true

    def full_name
        "ref_#{id} #{reservation.id} #{bateau_proprietaire_nom} #{loc_nom} "
    end
end
