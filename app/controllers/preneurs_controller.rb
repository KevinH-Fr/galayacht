class PreneursController < ApplicationController
  before_action :set_preneur, only: %i[ show edit update destroy ]

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
        format.html { redirect_to preneur_url(@preneur), notice: "Preneur was successfully created." }
        format.json { render :show, status: :created, location: @preneur }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @preneur.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @preneur.update(preneur_params)
        format.html { redirect_to preneur_url(@preneur), notice: "Preneur was successfully updated." }
        format.json { render :show, status: :ok, location: @preneur }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @preneur.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @preneur.destroy

    respond_to do |format|
      format.html { redirect_to preneurs_url, notice: "Preneur was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_preneur
      @preneur = Preneur.find(params[:id])
    end

    def preneur_params
      params.require(:preneur).permit(:prenom, :nom, :telephone, :mail, :user_id)
    end
end
