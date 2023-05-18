module OccupationsHelper

    def occupation_produit_courant()
        Produit.find(params[:id])
    end
end
