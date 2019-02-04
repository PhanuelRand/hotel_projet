class ReservationsController < ApplicationController
  before_filter :set_reservation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reservations = Reservation.all
    respond_with(@reservations)
  end

  def show
    respond_with(@reservation)
  end

  def new
    @reservation = Reservation.new
    @chambres = Chambre.all
    respond_with(@reservation)
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    params[:reservation][:user_id] = current_user.id
    puts params.inspect
    @reservation = Reservation.create(params[:reservation])
    @chambres = Chambre.all
    
    @chambres.each do |chambre|
      @reservation_chambre = ReservationChambre.create({reservation_id: @reservation.id, chambre_id: chambre.id})
    end

    if @reservation.save
      flash[:success] = "Reservation created!"
      respond_with(@reservation)
    end
    # 1) Get ID of all rooms
    # 2) For each room ID, create ReservationChambre entry with : reservation_id, room_id
  end

  def update
    @reservation.update_attributes(params[:reservation])
    respond_with(@reservation)
  end

  def destroy
    @reservation.destroy
    # respond_with(@reservation)
    redirect_to (current_user)
  end

  private
    # def reservation_params
    #   params.require(:reservation).permit(:reservation_chambre_id, :date_arrive.to_sym, :date_depart.to_sym, :demande_particuliere, :price, :type_de_chambre, :type_de_vue, :user_age, :user_email, :user_id, :user_name)
    # end

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
end
