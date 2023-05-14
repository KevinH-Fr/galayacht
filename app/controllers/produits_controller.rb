class ProduitsController < ApplicationController
  before_action :set_produit, only: %i[ show edit update destroy ]

  def index
    @q = Produit.ransack(params[:q])

    if params[:city].present?
      city = params[:city].titleize
      @produits = Produit.where(city: city)
    else
    #  search_params = params.permit(:format, :page, :commit, q:[:nom_or_marque_or_city_cont])
    #  @produits = @q.result(distinct: true).order(created_at: :desc)
    
    @q = Produit.ransack(params[:q])
    @produits = @q.result(distinct: true).order(created_at: :desc)
 
    end
  end
  
  def show
  end

  def new
    @produit = Produit.new produit_params
  end

  def edit
  end

  def create
    @produit = Produit.new(produit_params)

    respond_to do |format|
      if @produit.save
        format.html { redirect_to produit_url(@produit), notice: "Produit was successfully created." }
        format.json { render :show, status: :created, location: @produit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @produit.update(produit_params)
        format.html { redirect_to produit_url(@produit), notice: "Produit was successfully updated." }
        format.json { render :show, status: :ok, location: @produit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @produit.destroy

    respond_to do |format|
      format.html { redirect_to produits_url, notice: "Produit was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    def set_produit
      @produit = Produit.find(params[:id])
    end

    def produit_params
      params.fetch(:produit, {}).permit(:nom, :type_produit, :longueur, :largeur, :marque, :model, :prixjour, :prixsemaine, :image1, :bailleur_id,
                                      :country, :state, :city, :capacite, :capitaine)
    end
end
