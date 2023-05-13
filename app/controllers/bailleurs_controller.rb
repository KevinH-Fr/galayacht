class BailleursController < ApplicationController
  before_action :set_bailleur, only: %i[ show edit update destroy ]

  # GET /bailleurs or /bailleurs.json
  def index
    @bailleurs = Bailleur.all
  end

  # GET /bailleurs/1 or /bailleurs/1.json
  def show
  end

  # GET /bailleurs/new
  def new
    @bailleur = Bailleur.new
  end

  # GET /bailleurs/1/edit
  def edit
  end

  # POST /bailleurs or /bailleurs.json
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

  # PATCH/PUT /bailleurs/1 or /bailleurs/1.json
  def update
    respond_to do |format|
      if @bailleur.update(bailleur_params)
        format.html { redirect_to bailleur_url(@bailleur), notice: "Bailleur was successfully updated." }
        format.json { render :show, status: :ok, location: @bailleur }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bailleur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bailleurs/1 or /bailleurs/1.json
  def destroy
    @bailleur.destroy

    respond_to do |format|
      format.html { redirect_to bailleurs_url, notice: "Bailleur was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bailleur
      @bailleur = Bailleur.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bailleur_params
      params.require(:bailleur).permit(:prenom, :nom, :telephone, :mail, :user_id, :profilepic)
    end
end
