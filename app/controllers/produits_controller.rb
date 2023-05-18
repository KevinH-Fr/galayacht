class ProduitsController < ApplicationController
  before_action :set_produit, only: %i[ show edit update destroy ]

  def index
    @destinations = Destination.all

    @q = Produit.ransack(params[:q])

    if params[:city].present?
      destination = params[:city].titleize
      @produits = Produit.where(destination_id: destination)
    else
    #  search_params = params.permit(:format, :page, :commit, q:[:nom_or_marque_or_city_cont])
    #  @produits = @q.result(distinct: true).order(created_at: :desc)
    
    @q = Produit.ransack(params[:q])
    @produits = @q.result(distinct: true).order(created_at: :desc)
 
    end
  end
  
  def show
    @occupations = @produit.occupations

    session[:produit] = @produit.id
  end

  def new
    @produit = Produit.new  
    @destinations = Destination.all

    @occupation = @produit.occupations.build 

  end

  def edit
    @destinations = Destination.all
    @occupations = @produit.occupations

    respond_to do |format|
      format.html
      format.turbo_stream do  
        render turbo_stream: turbo_stream.update(@produit, partial: "produits/form", 
          locals: {produit: @produit})
      end
    end

  end

  def create
    @produit = Produit.new(produit_params)
    @destinations = Destination.all


    respond_to do |format|
      if @produit.save
        format.turbo_stream do
          flash.now[:notice] = "le produit #{@produit.nom} a bien été ajouté"
          render turbo_stream: [
            turbo_stream.update('new_produit', partial: "produits/form", locals: {produit: Produit.new}),
            turbo_stream.prepend("produits", partial: "produits/produit",
              locals: {produit: @produit }), 
              turbo_stream.update("flash", partial: "layouts/flash"),     
            ]
        end

      else
        flash.now[:notice] = "erreur - le produit n'a pas été ajouté"
        format.turbo_stream do
          render turbo_stream: [
             turbo_stream.update("flash", partial: "layouts/flashError"),
           ]
         end
      end
    end
  end

  def update
    @destinations = Destination.all

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
      params.fetch(:produit, {}).permit(:nom, :type_produit, :longueur, :largeur, :marque, :model, :prixjour, :prixsemaine, :prixjour_hautesaison, :prixsemaine_hautesaison, :image1, :bailleur_id,
                                      :country, :state, :city, :capacite, :capitaine, :destination_id,
                                       occupations_attributes: [:debut, :fin])
    end
end
