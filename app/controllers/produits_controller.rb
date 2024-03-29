class ProduitsController < ApplicationController

  include UserHelper
  
  before_action :set_produit, only: %i[ show edit update destroy ]
  before_action :authorize_admin, except: [:index, :show, :edition, :fullscreen]

  def index
    @destinations = Destination.all

    if current_user && user_admin 
      @q = Produit.ransack(params[:q])
    else
      @q = Produit.actif.ransack(params[:q])
    end

    # get filters for locaiton or vente

    if params[:q]
      location_value = params[:q][:location_eq]     
      @checked_location = location_value == "1" || location_value == "true"
      
      vente_value = params[:q][:vente_eq]     
      @checked_vente = vente_value == "1" || vente_value == "true"
    end
    

    @produits = @q.result(distinct: true)
    @pagy, @produits = pagy(@produits, items: 6)

    if params[:city].present?
      destination = params[:city].titleize
      @produits = Produit.actif.where(destination_id: destination)
      @pagy, @produits = pagy(@produits, items: 6)

    end
  end

  def archive
    @produits = Produit.archive
  end

  def activate
    @produit = Produit.find(params[:id])
    @produit.update(archive: false)

    redirect_to @produit, notice: 'Produit has been activated.'
  end

  def archivate
    @produit = Produit.find(params[:id])
    @produit.update(archive: true)

    redirect_to @produit, notice: 'Produit has been archived.'
  end
  
  def show
    @schedules = @produit.schedules
    session[:produit] = @produit.id
  end

  def fullscreen
    @produit = Produit.find(params[:id])
    # Render a separate view that displays the image in full screen
    render 'fullscreen'
  end

  def new
    @produit = Produit.new  
    @destinations = Destination.all
    @bailleurs = Bailleur.all
   # @occupation = @produit.occupations.build 
  end

  def edit
    @destinations = Destination.all
    @bailleurs = Bailleur.all
  #  @occupations = @produit.occupations

    respond_to do |format|
      format.html
      format.turbo_stream do  
        render turbo_stream: turbo_stream.update(@produit, partial: "produits/form", 
          locals: {produit: @produit})
      end
    end

  end

  def edition 
    @produit = Produit.find(params[:id])
    
    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(
        template: "editions/produit", 
        formats: [:html],
        disposition: :inline,              
        layout: 'pdf'
      ),
       header: {
         content: render_to_string(
           'editions/doc_entete',
           layout: 'pdf'
         )
       },
       footer: {
         content: render_to_string(
           'editions/doc_footer',
           layout: 'pdf'
         )
       }
      )

    send_data pdf,

    filename: "galayacht_fiche_#{@produit.model}.pdf",
    type: 'application/pdf',
    disposition: 'inline'
  
  end


  
  def create
    @produit = Produit.new(produit_params)
    @destinations = Destination.all

    respond_to do |format|
      if @produit.save
        flash.now[:success] = "produit was successfully created"

        #format.turbo_stream do
        #  flash.now[:notice] = "le produit #{@produit.nom} a bien été ajouté"
        #  render turbo_stream: [
        #    turbo_stream.update('new_produit', partial: "produits/form", locals: {produit: Produit.new}),
        #    turbo_stream.prepend("produits", partial: "produits/produit",
        #      locals: {produit: @produit }), 
        #      turbo_stream.update("flash", partial: "layouts/flash"),     
        #    ]
        #end  
        format.html { redirect_to produit_url(@produit) }
    
      else
        flash.now[:error] = "erreur - le produit n'a pas été ajouté"
       # format.turbo_stream do
       #   render turbo_stream: [
       #      turbo_stream.update("flash", partial: "layouts/flash"),
       #    ]
       #  end
         format.html { render :edit, status: :unprocessable_entity }
         format.json { render json: @produit.errors, status: :unprocessable_entity }
 
      end
    end
  end

  def update
    @destinations = Destination.all
    @bailleurs = Bailleur.all

    # Retain existing medias if the field is left empty
    if params[:produit][:medias].blank?
      @produit.medias.attach(@produit.medias)
    end
    
    respond_to do |format|
      if @produit.update(produit_params)
        flash.now[:success] = "produit was successfully updated"
        format.html { redirect_to produit_url(@produit), alert: "Produit was successfully updated." }
        format.json { render :show, status: :ok, location: @produit }
      else
        flash.now[:error] = "erreur - le produit n'a pas été modifié"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @produit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @produit.destroy
  
    respond_to do |format|
      format.html { redirect_to espace_admin_index_url, notice: "Le produit a bien été supprimé." }
      format.json { head :no_content }
     # format.turbo_stream do
     #   render turbo_stream: [
     #     turbo_stream.update("flash", partial: "layouts/flash")
     #   ]
     # end
    end
  end
  

  def delete_image1_attachment
    @produit = Produit.find(params[:id])
    @produit.image1.purge 

    redirect_to @produit, notice: 'Image1 has been deleted successfully.'
  end

  def delete_media_attachment
    @produit = Produit.find(params[:id])
    @media = @produit.medias.find(params[:media_id])
    @media.purge
  
    redirect_to @produit, notice: 'Media has been deleted successfully.'
  end


  private
    def set_produit
      @produit = Produit.find(params[:id])
    end

    def produit_params
      params.require(:produit).permit(:nom, :type_produit, :longueur, :largeur, :marque, :model, :nb_cabines,
          :location, :vente, :prixventenv, :prixventefai,
          :prixjour, :prixsemaine, :prixjour_hautesaison, :prixsemaine_hautesaison, :bailleur_id,
          :country, :state, :city, :capacite, :capitaine, :destination_id, :toys,
          :tirant, :members, :annee, :pavillon, :moteur, :vitesse, :consommation, :archive,
          :image1, medias: [])
    end



    def authorize_admin
      unless current_user && user_admin
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end

end
