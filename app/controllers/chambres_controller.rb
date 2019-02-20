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
    @chambre = Chambre.new(chambre_params)

    @type_chambre = TypeChambre.where(type_de_chambre: params[:type_de_chambre]).first
    @type_vue = TypeVue.where(type_de_vue: params[:type_de_vue]).first
    @chambre.type_chambre = @type_chambre
    @chambre.type_vue = @type_vue

    @chambre.save
    respond_with(@chambre)
  end

  def update
    # @chambre = Chambre.find(params[:id])
    @chambre.update_attributes(chambre_params)
    # @chambre.type_chambre.update_attributes(type_de_chambre: params[:type_de_chambre])
    # @chambre.type_vue.update_attributes(type_de_vue: "Jungle")
  end

  def destroy
    @chambre.destroy
    respond_with(@chambre)
  end

  private
    def chambre_params
      params.require(:chambre).permit(:name, :image_url, :numero, :type_de_vue, :type_de_chambre)    
    end

    def set_chambre
      @chambre = Chambre.find(params[:id])
    end
end
