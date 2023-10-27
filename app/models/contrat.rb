class Contrat < ApplicationRecord
    belongs_to :reservation, optional: true

    def full_name
        "ref_#{id} #{bateau_proprietaire_nom} #{loc_nom} "
    end

    def full_prix
        prix_ht.to_i + tva.to_i
    end
end
