class DestinationsController < ApplicationController.
  include UserHelper
  before_action :set_destination, only: %i[ show edit update destroy ]
  before_action :authorize_admin, except: [:index, :show]

  def index
    @destinations = Destination.all
  end
 
  def show
  end

  def new
    @destination = Destination.new
  end

  def edit
  end

  def create
    @destination = Destination.new(destination_params)

    respond_to do |format|
      if @destination.save
        flash[:success] = "destination was created."
        format.html { redirect_to destination_url(@destination) }
        format.json { render :show, status: :created, location: @destination }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @destination.update(destination_params)
        flash[:success] = "destination was updated."
        format.html { redirect_to destination_url(@destination) }
        format.json { render :show, status: :ok, location: @destination }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @destination.destroy

    respond_to do |format|
      flash[:success] = "destination was delted."
      format.html { redirect_to destinations_url, notice: "Destination was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private


  def authorize_admin
    unless current_user && user_admin
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end


    def set_destination
      @destination = Destination.find(params[:id])
    end

    def destination_params
      params.require(:destination).permit(:nom, :pays, :ville, :cp, :port, :image1)
    end
end
