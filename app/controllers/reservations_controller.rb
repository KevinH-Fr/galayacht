class ReservationsController < ApplicationController

  include UserHelper
  
  before_action :set_reservation, only: %i[ show edit update destroy ]
  before_action :require_preneur, only: [:new]


  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])

  end

  def new
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
 
   # if AdminParameter.first.present?
      # affecter une valeur au champ remu 
     # tauxRemuneration = AdminParameter.first.remuneration
     # @reservation.remuneration = @reservation.prix * (tauxRemuneration / 100)
   # end 

    respond_to do |format|
      if @reservation.save
        send_reservation_email_preneur(@reservation.id)
        send_reservation_email_bailleur(@reservation.id)

      


        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def edition_test
    @reservation = Reservation.find(params[:id])
    
    render html: render_to_string(
      template: "editions/reservation",
      formats: [:html],
      layout: 'pdf'
    )
  end
  

  def send_reservation_email_preneur(reservation)
    @reservation = Reservation.find(reservation)
    ReservationMailer.reservation_created_bailleur(@reservation.id).deliver_now
 #   redirect_to @reservation
  end
 
  
  def send_reservation_email_bailleur(reservation)
    @reservation = Reservation.find(reservation)
    ReservationMailer.reservation_created_preneur(@reservation.id).deliver_now
 #   redirect_to @reservation
  end

  private

  def require_preneur
    if current_user.present?
      if user_preneur.present?
        # ok resa possible
      else
        redirect_to new_preneur_path, alert: "Please create a locataire profile to continue."
      end
    else
      redirect_to new_user_session_path, alert: "Please create a user profile to continue."
    end

  end

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:produit_id, :preneur_id, :debutlocation, :finlocation, :prix, :remuneration, :statut)
    end
end
