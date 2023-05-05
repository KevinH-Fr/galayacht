module PreneursHelper

    def preneur_full_name(preneur)
       "#{Preneur.find(preneur).prenom} #{Preneur.find(preneur).nom}"
    end
end
