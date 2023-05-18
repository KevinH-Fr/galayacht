class OccupationProduitsController < ApplicationController
  before_action :set_occupation_produit, only: %i[ show edit update destroy ]

  # GET /occupation_produits or /occupation_produits.json
  def index
    @occupation_produits = OccupationProduit.all
  end

  # GET /occupation_produits/1 or /occupation_produits/1.json
  def show
  end

  # GET /occupation_produits/new
  def new
    @occupation_produit = OccupationProduit.new
  end

  # GET /occupation_produits/1/edit
  def edit
  end

  # POST /occupation_produits or /occupation_produits.json
  def create
    @occupation_produit = OccupationProduit.new(occupation_produit_params)

    respond_to do |format|
      if @occupation_produit.save
        format.html { redirect_to occupation_produit_url(@occupation_produit), notice: "Occupation produit was successfully created." }
        format.json { render :show, status: :created, location: @occupation_produit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @occupation_produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /occupation_produits/1 or /occupation_produits/1.json
  def update
    respond_to do |format|
      if @occupation_produit.update(occupation_produit_params)
        format.html { redirect_to occupation_produit_url(@occupation_produit), notice: "Occupation produit was successfully updated." }
        format.json { render :show, status: :ok, location: @occupation_produit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @occupation_produit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occupation_produits/1 or /occupation_produits/1.json
  def destroy
    @occupation_produit.destroy

    respond_to do |format|
      format.html { redirect_to occupation_produits_url, notice: "Occupation produit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occupation_produit
      @occupation_produit = OccupationProduit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def occupation_produit_params
      params.require(:occupation_produit).permit(:debut, :fin, :produit_id)
    end
end
