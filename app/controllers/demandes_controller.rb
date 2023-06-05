class DemandesController < ApplicationController
  before_action :set_demande, only: %i[ show edit update destroy ]

  # GET /demandes or /demandes.json
  def index
    @demandes = Demande.all
  end

  # GET /demandes/1 or /demandes/1.json
  def show
  end

  # GET /demandes/new
  def new
    @demande = Demande.new

    @produit = Produit.find(params[:produitId]) if params[:produitId]
    @demande_proprietaire = params[:demandeId] 
    

  end

  # GET /demandes/1/edit
  def edit
  end

  # POST /demandes or /demandes.json
  def create
    @demande = Demande.new(demande_params)

    respond_to do |format|
      if @demande.save
        format.html { redirect_to demande_url(@demande), notice: "Demande was successfully created." }
        format.json { render :show, status: :created, location: @demande }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @demande.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demandes/1 or /demandes/1.json
  def update
    respond_to do |format|
      if @demande.update(demande_params)
        format.html { redirect_to demande_url(@demande), notice: "Demande was successfully updated." }
        format.json { render :show, status: :ok, location: @demande }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @demande.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demandes/1 or /demandes/1.json
  def destroy
    @demande.destroy

    respond_to do |format|
      format.html { redirect_to demandes_url, notice: "Demande was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demande
      @demande = Demande.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def demande_params
      params.require(:demande).permit(:nom, :mail, :telephone, :type_demande, :commentaires)
    end
end
