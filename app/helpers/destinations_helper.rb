module DestinationsHelper

    def localisation_port(localisation)
        destination = Destination.find(localisation)
        "#{destination.ville} #{destination.port}"
    end

end
