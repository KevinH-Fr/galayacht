module UserHelper
    def user_preneur
        Preneur.where(user_id: current_user.id).first if  Preneur.where(user_id: current_user).present?
    end
    def user_bailleur
        Bailleur.where(user_id: current_user.id).first if Bailleur.where(user_id: current_user).present?
    end

end
