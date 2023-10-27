class AdminParametersController < ApplicationController
  include UserHelper
  before_action :set_admin_parameter, only: %i[ show edit update destroy ]
  before_action :authorize_admin

  def index
    @admin_parameters = AdminParameter.all
  end

  def show
  end

  def new
    @admin_parameter = AdminParameter.new
  end

  def edit
  end

  def create
    @admin_parameter = AdminParameter.new(admin_parameter_params)

    respond_to do |format|
      if @admin_parameter.save
        format.html { redirect_to admin_parameter_url(@admin_parameter), notice: "Admin parameter was successfully created." }
        format.json { render :show, status: :created, location: @admin_parameter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_parameter.update(admin_parameter_params)
        format.html { redirect_to admin_parameter_url(@admin_parameter), notice: "Admin parameter was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_parameter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_parameter.destroy

    respond_to do |format|
      format.html { redirect_to admin_parameters_url, notice: "Admin parameter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_parameter
      @admin_parameter = AdminParameter.find(params[:id])
    end

    def admin_parameter_params
      params.require(:admin_parameter).permit(:remuneration, :hautesaison, :rich_conditions_generales)
    end

    def authorize_admin
      unless current_user && user_admin
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
end
