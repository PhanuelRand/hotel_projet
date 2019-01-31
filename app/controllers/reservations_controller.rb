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
  end

  def create
    # @reservation = Reservation.new(params[:reservation])
    @reservation = current_user.reservations.build(params[:reservation])
    if @reservation.save
      flash[:success] = "Micropost created!"
      respond_with(@reservation)
    end
  end

  def update
    @reservation.update_attributes(params[:reservation])
    respond_with(@reservation)
  end

  def destroy
    @reservation.destroy
    respond_with(@reservation)
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
end
