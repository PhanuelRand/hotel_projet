class Admin::ChambresController < AdminController
  before_filter :set_chambre, only: [:show, :edit, :update, :destroy]

  respond_to :html

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
    @chambre = Chambre.new(chambre_params)

    @type_chambre = TypeChambre.where(type_de_chambre: params[:type_de_chambre]).first
    @type_vue = TypeVue.where(type_de_vue: params[:type_de_vue]).first
    @chambre.type_chambre = @type_chambre
    @chambre.type_vue = @type_vue

    @chambre.save
    respond_with(@chambre)
  end

  def update
    @chambre.update_attributes(chambre_params)
    respond_with(@chambre)
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
