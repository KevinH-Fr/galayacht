class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    include Pagy::Backend

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [ 
        bailleur_attributes: [:prenom, :nom, :telephone, :profilepic],
        preneur_attributes: [:prenom, :nom, :telephone, :profilepic]])
    end
end
