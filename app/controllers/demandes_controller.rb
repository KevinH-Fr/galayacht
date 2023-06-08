class DemandesController < ApplicationController
  include UserHelper
  before_action :set_demande, only: %i[ show edit update destroy ]

  before_action :authorize_admin, except: [:new, :create]

  def index
    @demandes = Demande.all
  end

  def show
  end

  def new
    @demande = Demande.new

    @produit = Produit.find(params[:produitId]) if params[:produitId]
    @demande_proprietaire = params[:demandeId] 
    

  end

  def edit
  end

  def create
    @demande = Demande.new(demande_params)

    respond_to do |format|
      if @demande.save
        flash[:success] = "demande was created."
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @demande }
      else
        flash[:error] = "demande could not be created."
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @demande.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @demande.update(demande_params)
        flash[:success] = "demande was updated."
        format.html { redirect_to demande_url(@demande), notice: "Demande was successfully updated." }
        format.json { render :show, status: :ok, location: @demande }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @demande.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @demande.destroy

    respond_to do |format|
      flash[:success] = "demande was deleted."
      format.html { redirect_to demandes_url, notice: "Demande was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_demande
      @demande = Demande.find(params[:id])
    end

    def demande_params
      params.require(:demande).permit(:nom, :mail, :telephone, :type_demande, :commentaires)
    end

    def authorize_admin
      unless current_user && user_admin
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
end
