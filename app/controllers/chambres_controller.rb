class ChambresController < ApplicationController
  before_filter :set_chambre, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @chambres = Chambre.all
    respond_with(@chambres)
  end

  def show
    respond_with(@chambre)
  end

  def new
    @chambre = Chambre.new
    respond_with(@chambre)
  end

  def edit
  end

  def create
    @chambre = Chambre.new(params[:chambre])
    @chambre.save
    respond_with(@chambre)
  end

  def update
    @chambre.update_attributes(params[:chambre])
    respond_with(@chambre)
  end

  def destroy
    @chambre.destroy
    respond_with(@chambre)
  end

  private
    def set_chambre
      @chambre = Chambre.find(params[:id])
    end
end
