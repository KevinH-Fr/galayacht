class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]

  # GET /schedules or /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1 or /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new schedule_params
  end

  def edit
    respond_to do |format|
      format.html
      format.turbo_stream do  
        render turbo_stream: turbo_stream.update(@schedule, partial: "schedules/form", 
          locals: {schedule: @schedule})
      end
    end
  end

  def create
    @schedule = Schedule.new(schedule_params)
  #  @produit = Produit.find(session[:produit])

    respond_to do |format|
      if @schedule.save
        format.turbo_stream do
          flash.now[:notice] = "le schedule #{@schedule.title} a bien été ajouté"
          render turbo_stream: [
            turbo_stream.update('new_schedule', partial: "schedules/form", locals: {schedule: Schedule.new}),
            turbo_stream.append("schedules", partial: "schedules/schedule",
              locals: {schedule: @schedule }), 
              turbo_stream.update("flash", partial: "layouts/flash"),     
            ]
        end

      else
        flash.now[:notice] = "erreur - le schedule n'a pas été ajouté"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("flash", partial: "layouts/flashError"),
          ]
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.turbo_stream do  
          flash.now[:notice] = "le schedule #{@schedule.title} a bien été modifié"
          render turbo_stream: [
            turbo_stream.update(@schedule, partial: "schedules/schedule", 
              locals: {schedule: @schedule}),
              turbo_stream.update("flash", partial: "layouts/flash")
           ]
        end
        format.html  { redirect_to schedule_url(@schedule), notice: "schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @schedule }

      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@schedule) }
   #  format.html { redirect_to pilotes_url, notice: "schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.fetch(:schedule, {}).permit(:title, :start, :end, :produit_id)
    end
end
