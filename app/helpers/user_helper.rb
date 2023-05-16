module UserHelper
    def user_preneur
        Preneur.where(user_id: current_user.id).first
    end
    def user_bailleur
        Bailleur.where(user_id: current_user.id).first
    end

end
