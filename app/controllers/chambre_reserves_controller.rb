class ChambreReservesController < ApplicationController
  before_filter :set_chambre_reserf, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @chambre_reserves = ChambreReserve.all
    respond_with(@chambre_reserves)
  end

  def show
    respond_with(@chambre_reserf)
  end

  def new
    @chambre_reserf = ChambreReserve.new
    respond_with(@chambre_reserf)
  end

  def edit
  end

  def create
    # @chambre_reserf = ChambreReserve.new(params[:chambre_reserve])
    @chambre_reserf = Chambre.chambre_reserf.build(params[:chambre_reserf])
    @chambre_reserf.save
    respond_with(@chambre_reserf)
  end

  def update
    @chambre_reserf.update_attributes(params[:chambre_reserve])
    respond_with(@chambre_reserf)
  end

  def destroy
    @chambre_reserf.destroy
    respond_with(@chambre_reserf)
  end

  private
    def set_chambre_reserf
      @chambre_reserf = ChambreReserve.find(params[:id])
    end
end
