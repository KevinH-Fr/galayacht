class OccupationsController < ApplicationController
  before_action :set_occupation, only: %i[ show edit update destroy ]

  def index
    @occupations = Occupation.all
  end

  def show
  end

  def new
    @occupation = Occupation.new occupation_params
    @produit = Produit.find(params[:id])
  end

  def edit
    respond_to do |format|
      format.html
      format.turbo_stream do  
        render turbo_stream: turbo_stream.update(@occupation, partial: "occupations/form", 
          locals: {occupation: @occupation})
      end
    end
  end

  def create
    @occupation = Occupation.new(occupation_params)
    @produit = Produit.find(session[:produit])

    respond_to do |format|
      if @occupation.save

        format.turbo_stream do
          flash.now[:notice] = "le occupation #{@occupation.nom} a bien été ajouté"
          render turbo_stream: [
            turbo_stream.update('new_occupation', partial: "occupations/form", locals: {occupation: Occupation.new}),
            turbo_stream.prepend("occupations", partial: "occupations/occupation",
              locals: {occupation: @occupation }), 
              turbo_stream.update("flash", partial: "layouts/flash"),     
            ]
        end

      else
        flash.now[:notice] = "erreur - le occupation n'a pas été ajouté"
        format.turbo_stream do
          render turbo_stream: [
             turbo_stream.update("flash", partial: "layouts/flash"),
           ]
         end
         format.html { render :new, status: :unprocessable_entity }
         format.json { render json: @occupation.errors, status: :unprocessable_entity }
 
      end
    end
  end

  def update
    respond_to do |format|
      if @occupation.update(occupation_params)
        format.turbo_stream do  
          flash.now[:notice] = "le occupation #{@occupation.nom} a bien été modifié"
          render turbo_stream: [
            turbo_stream.update(@occupation, partial: "occupations/occupation", 
              locals: {occupation: @occupation}),
              turbo_stream.update("flash", partial: "layouts/flash")
           ]
        end
        format.html  { redirect_to pilote_url(@pilote), notice: "Pilote was successfully updated." }
        format.json { render :show, status: :ok, location: @pilote }

      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @occupation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @occupation.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@occupation) }
      format.html { redirect_to occupations_url, notice: "Occupation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_occupation
      @occupation = Occupation.find(params[:id])
    end

    def occupation_params
      params.fetch(:occupation, {}).permit(:debut, :fin, :produit_id, :nom)
    end
end
