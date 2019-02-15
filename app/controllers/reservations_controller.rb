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

    prix_total = 0
    price_chambres = 0
    price_vue_jungle = 0
    price_vue_mer = 0
    @nb_jour = 0

    params[:reservation][:user_id] = current_user.id

    @reservation = Reservation.create(params[:reservation])
    @date_debut = @reservation.date_arrive
    @date_fin = @reservation.date_depart

    @nb_jour = (@date_fin.to_date - @date_debut.to_date).to_i
    # binding.pry
    @list_chambre = @reservation.list_chambres
    @chambres = Chambre.where(numero: @list_chambre)
    @chambres.each do |chambre|
      @reservation_chambre = ReservationChambre.create({reservation_id: @reservation.id, chambre_id: chambre.id})

      price_chambres += @chambres.where(:type_chambre => chambre.type_chambre).sum(:price)
      price_vue_jungle += @chambres.where(["type_chambre = ? and vue = ?", chambre.type_chambre, "Jungle"]).sum(:vue_jungle_price)
      price_vue_mer += @chambres.where(["type_chambre = ? and vue = ?", chambre.type_chambre, "Mer"]).sum(:vue_mer_price)
    end

    @reservation.update_attributes(:price => (price_chambres + price_vue_jungle + price_vue_mer) * @nb_jour)
    
    if @reservation.save
      flash[:success] = "Reservation created!"
      respond_with(@reservation)
    end
  end

  def show_filtered_room
    type_chambre = params[:type_chambre]
    type_vue = params[:type_vue]

    if type_chambre == "None" && type_vue == "None"
      @chambres = Chambre.all
    else
      if type_chambre == "None" && type_vue != "None"
        @chambres = Chambre.where(type_vue: type_vue)
      elsif type_chambre != "None" && type_vue == "None"
        @chambres = Chambre.where(type_chambre: type_chambre)
      else
        @chambres = Chambre.where(["type_chambre = ? and vue = ?", type_chambre, type_vue])
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
