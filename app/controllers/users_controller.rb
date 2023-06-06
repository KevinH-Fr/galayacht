class UsersController < ApplicationController
  include UserHelper
  before_action :authorize_admin

  def show
    @user = User.find(params[:id]) 
  end

  private 

  def authorize_admin
    unless current_user && user_admin
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end

end
