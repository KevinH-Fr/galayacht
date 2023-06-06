class BailleursController < ApplicationController
  include UserHelper
  before_action :set_bailleur, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  def index
    @bailleurs = Bailleur.all
  end

  def show
  end

  def new
    @bailleur = Bailleur.new
  end

  def edit
  end

  def create
    @bailleur = Bailleur.new(bailleur_params)

    respond_to do |format|
      if @bailleur.save
        format.html { redirect_to bailleur_url(@bailleur), notice: "Bailleur was successfully created." }
        format.json { render :show, status: :created, location: @bailleur }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bailleur.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bailleur.update(bailleur_params)
        format.html { redirect_to bailleur_url(@bailleur), notice: "Bailleur was successfully updated." }
        format.json { render :show, status: :ok, location: @bailleur }
      else
        flash[:error] = "propriétaire could not be updated."
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bailleur.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bailleur.destroy

    respond_to do |format|
      format.html { redirect_to bailleurs_url, notice: "Bailleur was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_bailleur
      @bailleur = Bailleur.find(params[:id])
    end

    def bailleur_params
      params.require(:bailleur).permit(:prenom, :nom, :telephone, :mail, :user_id, :profilepic)
    end

    def authorize_admin
      unless current_user && user_admin
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
end
