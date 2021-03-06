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

    respond_to do |format|
      format.html
      format.js {render layout: false}
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    params[:reservation][:user_id] = current_user.id
    @reservation = Reservation.create(params[:reservation])
    @chambres = Chambre.where(numero: params[:reservation][:list_chambres])

    @chambres.each do |chambre|
      @reservation_chambre = ReservationChambre.create({reservation_id: @reservation.id, chambre_id: chambre.id})
    end

    if @reservation.save
      flash[:success] = "Reservation created!"
      respond_with(@reservation)
    end
  end

  def show_filtered_room
    type_chambre = params[:type_chambre_id]
    type_vue = params[:type_vue_id]

    if type_chambre == "None" && type_vue == "None"
      @chambres = Chambre.all
    else
      if type_chambre == "None" && type_vue != "None"
        @chambres = Chambre.where(type_chambre_id: type_chambre)
      elsif type_chambre != "None" && type_vue == "None"
        @chambres = Chambre.where(type_vue_id: type_vue)
      else
        @chambres =  Chambre.where(["type_chambre_id = ? and type_vue_id = ?", type_chambre, type_vue])
      end
    end

    render json: @chambres
  end

  def update
    @reservation.update_attributes(params[:reservation])
    respond_with(@reservation)
  end

  def destroy
    @reservation.destroy
    redirect_to (current_user)
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
end
