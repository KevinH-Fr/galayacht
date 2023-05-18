module DestinationsHelper

    def localisation_port(localisation)
        if localisation.present?
            destination = Destination.find(localisation)
            "#{destination.ville} #{destination.port}"
        end
    end

end
