class ChambresController < ApplicationController
  before_filter :set_chambre, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def list_jungle
    @chambre_jungle = Chambre.where(vue: "Jungle")

    respond_to do |format|
      format.html
      format.js {render layout: false}
    end
  end

  def list_mer
    @chambre_mer = Chambre.where(vue: "Mer")

    respond_to do |format|
      format.html
      format.js {render layout: false}
    end
  end

  def list_simple
    @chambre_simple = Chambre.where(type_chambre: "Simple")

    respond_to do |format|
      format.html
      format.js {render layout: false}
    end
  end

  def list_double
    @chambre_double = Chambre.where(type_chambre: "Double")

    respond_to do |format|
      format.html
      format.js {render layout: false}
    end
  end

  def list_executive
    @chambre_executive = Chambre.where(type_chambre: "Executive")

    respond_to do |format|
      format.html
      format.js {render layout: false}
    end
  end

  def list_presidentielle
    @chambre_presidentielle = Chambre.where(type_chambre: "Presidentielle")

    respond_to do |format|
      format.html
      format.js {render layout: false}
    end
  end

  def list_all
    @chambres = Chambre.all

    respond_to do |format|
      format.html
      format.js {render layout: false}
    end
  end

  def index
    @chambres = Chambre.all  
    # respond_with(@chambres)
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
