class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
  before_action :require_preneur, only: [:new]

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
  end
  before_action :require_preneur, only: [:new]
  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edition 
    @reservation = Reservation.find(params[:id])
    
    pdf = WickedPdf.new.pdf_from_string(
      render_to_string(
        template: "editions/reservation", 
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
    filename: "reservation.pdf",
    type: 'application/pdf',
    disposition: 'inline'
  
  end

  private

  def require_preneur
    if current_user.present?
      if Preneur.where(user_id: current_user.id).present?
      else
      redirect_to new_user_session_path, alert: "Please log in or sign up to continue."
      end
    else
      redirect_to new_user_session_path, alert: "Please log in or sign up to continue."

    end

  end

    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:produit_id, :preneur_id, :debutlocation, :finlocation, :prix, :statut)
    end
end
