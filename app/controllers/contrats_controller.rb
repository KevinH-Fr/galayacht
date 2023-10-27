class ContratsController < ApplicationController
  include UserHelper

  before_action :set_contrat, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  # GET /contrats or /contrats.json
  def index
    @contrats = Contrat.all
  end

  # GET /contrats/1 or /contrats/1.json
  def show
  end

  # GET /contrats/new
  def new
    @contrat = Contrat.new contrat_params
  end

  # GET /contrats/1/edit
  def edit
  end

  # POST /contrats or /contrats.json
  def create
    @contrat = Contrat.new(contrat_params)

    respond_to do |format|
      if @contrat.save
        format.html { redirect_to contrat_url(@contrat), notice: "Contrat was successfully created." }
        format.json { render :show, status: :created, location: @contrat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contrat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contrats/1 or /contrats/1.json
  def update
    respond_to do |format|
      if @contrat.update(contrat_params)
        format.html { redirect_to contrat_url(@contrat), notice: "Contrat was successfully updated." }
        format.json { render :show, status: :ok, location: @contrat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contrat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contrats/1 or /contrats/1.json
  def destroy
    @contrat.destroy

    respond_to do |format|
      format.html { redirect_to contrats_url, notice: "Contrat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  
  def edition 
    @contrat = Contrat.find(params[:id])
    
    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(
        template: "editions/contrat", 
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

    filename: "contrat_#{@contrat.id}.pdf",
    type: 'application/pdf',
    disposition: 'inline'
  
  end

  def edition_capitaine
    @contrat = Contrat.find(params[:id])
    
    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(
        template: "editions/contrat_capitaine", 
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

    filename: "contrat_capitaine_#{@contrat.id}.pdf",
    type: 'application/pdf',
    disposition: 'inline'
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contrat
      @contrat = Contrat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contrat_params
      params.fetch(:contrat, {}).permit(:reservation_id, :model_contrat, :loc_nom, :loc_adresse, :loc_telephone, :loc_mail, 
        :bateau_ref, :bateau_proprietaire_nom, :bateau_marque, :bateau_model, 
        :armement, :moteur, :carbutant, :nb_equipage, :debut_loc, :fin_loc, :lieu, 
        :prix_ht, :tva, :acompte, :caution, :franchise, 
        :lieu_sign, :date_sign, 
        :capitaine, :capitaine_nom, :capitaine_tel, :capitaine_mail, :type_duree, :capitaine_debut,
        :capitaine_fin, :capitaine_renew, :capitaine_fonctions, :capitaine_periode_essai, 
        :capitaine_salaire, :capitaine_duree_travail, :capitaine_nourriture, :capitaine_indemnite_nourritaire_jour, 
        :capitaine_conges_payes, :capitaine_preavis)
    end

    
    def authorize_admin
      unless current_user && user_admin
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
end
