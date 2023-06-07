class ReservationsController < ApplicationController

  include UserHelper
  
  before_action :set_reservation, only: %i[ show edit update destroy ]
 # before_action :require_preneur, only: [:new]
  before_action :authorize_admin

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
    @preneurs = Preneur.all
  end

  def edit
    @preneurs = Preneur.all

  end

  def create
    @reservation = Reservation.new(reservation_params)
    @produit = Produit.find(@reservation.produit_id)
  
    respond_to do |format|
      if overlapping_reservations?(@reservation)
        flash[:error] = 'There is already a reservation for the same dates.'
        format.html { redirect_to @produit }
        format.json { render json: { error: 'There is already a reservation for the same dates.' }, status: :unprocessable_entity }
      elsif @reservation.save
        flash[:success] = "reservation was successfully created."
        Schedule.create(
          produit_id: @reservation.produit_id,
          title: "Autogénéré - réservation via appli",
          start: @reservation.debutlocation,
          end: @reservation.finlocation
        )
        format.html { redirect_to reservation_url(@reservation) }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
  
      format.any { head :unprocessable_entity } # Fallback response for unknown formats
    end
  end
  

  def update
    @preneurs = Preneur.all

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

    def overlapping_reservations?(new_reservation)
      existing_reservations = @produit.reservations
    
      existing_reservations.any? do |reservation|
        if reservation.debutlocation && reservation.finlocation
          new_reservation.debutlocation.between?(reservation.debutlocation, reservation.finlocation) ||
            new_reservation.finlocation.between?(reservation.debutlocation, reservation.finlocation) ||
            (new_reservation.debutlocation <= reservation.debutlocation && new_reservation.finlocation >= reservation.finlocation)
        else
          false
        end
      end
    end
    

    def authorize_admin
      unless current_user && user_admin
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
end
