class SchedulesController < ApplicationController
  include UserHelper
  before_action :set_schedule, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  def index

    if params[:id].present? #si page produits avec id produit
      # json pour refresh calendar
      @produit =  Produit.find(session[:produit])
      @schedules =  @produit.schedules
    else
      @schedules =  Schedule.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @schedules } # renvoyé pour le fectch de update schedules
    end

  end

  def show
  end

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

  @produit =  Produit.find(session[:produit])
  @schedules =  @produit.schedules


    respond_to do |format|
      if @schedule.save
        format.turbo_stream do
          flash.now[:notice] = "le schedule #{@schedule.title} a bien été ajouté"
          render turbo_stream: [
            turbo_stream.update('new_schedule', partial: "schedules/form", locals: {schedule: Schedule.new}),
            turbo_stream.append("schedules", partial: "schedules/schedule",
              locals: {schedule: @schedule }), 
            turbo_stream.update("flash", partial: "layouts/flash"),     
            turbo_stream.replace("divtoupdate",
              partial: "shared/tui_calendar", 
              locals: { schedules: @schedules }
            )
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

    @produit =  Produit.find(session[:produit])
    @schedules =  @produit.schedules

    respond_to do |format|
      if @schedule.update(schedule_params)
        format.turbo_stream do  
          render turbo_stream: [
            turbo_stream.update(@schedule, 
              partial: "schedules/schedule", 
              locals: { schedule: @schedule }
            ),
            turbo_stream.replace("divtoupdate",
              partial: "shared/tui_calendar", 
              locals: { schedules: @schedules }
            )
          ]
        end
  
        format.html do
          redirect_to schedule_url(@schedule), notice: "Schedule was successfully updated."
        end
  
        format.json { render :show, status: :ok, location: @schedule }
  
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def destroy
    @schedule.destroy

    @produit =  Produit.find(session[:produit])
    @schedules =  @produit.schedules

    respond_to do |format|
      format.turbo_stream do 
        render turbo_stream: [
          turbo_stream.remove(@schedule),
          turbo_stream.replace("divtoupdate",
            partial: "shared/tui_calendar", 
            locals: { schedules: @schedules }
          )
        ]
      end
      
   #  format.html { redirect_to pilotes_url, notice: "schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def schedule_params
      params.fetch(:schedule, {}).permit(:title, :start, :end, :produit_id)
    end
    
    def authorize_admin
      unless current_user && user_admin
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
end
