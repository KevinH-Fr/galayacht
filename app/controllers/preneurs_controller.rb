class PreneursController < ApplicationController
  include UserHelper
  before_action :set_preneur, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  def index
    @preneurs = Preneur.all
  end

  def show
  end

  def new
    @preneur = Preneur.new
  end

  def edit
  end

  def create
    @preneur = Preneur.new(preneur_params)

    respond_to do |format|
      if @preneur.save
        flash[:success] = "locataire was successfully created."
        format.html { redirect_to preneur_url(@preneur) }
        format.json { render :show, status: :created, location: @preneur }
      else
        flash[:error] = "locataire could not be created."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @preneur.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @preneur.update(preneur_params)
        flash[:success] = "locataire was successfully updated."
        format.html { redirect_to preneur_url(@preneur) }
        format.json { render :show, status: :ok, location: @preneur }
      else
        flash[:error] = "locataire could not be updated."
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @preneur.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @preneur.destroy

    respond_to do |format|
      flash[:success] = "locataire was successfully destroyed."
      format.html { redirect_to preneurs_url}
      format.json { head :no_content }
    end
  end

  private
    def set_preneur
      @preneur = Preneur.find(params[:id])
    end

    def preneur_params
      params.require(:preneur).permit(:prenom, :nom, :adresse, :telephone, :mail, :user_id, :profilepic)
    end

    def authorize_admin
      unless current_user && user_admin
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
end
