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
    @reservation = Reservation.new(params[:reservation])
    if @reservation.save
      flash[:success] = "Reservation created!"
      respond_with(@reservation)
    end
  end

  def update
    @reservation.update_attributes(params[:reservation])
    respond_with(@reservation)
  end

  def destroy
    @reservation.destroy
    # respond_with(@reservation)
    # redirect_to (current_user)
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
end
