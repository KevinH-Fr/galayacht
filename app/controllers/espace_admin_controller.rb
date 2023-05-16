class EspaceAdminController < ApplicationController
  def index
    @users = User.all
    @bailleurs = Bailleur.all
    @preneurs = Preneur.all
  end
end
