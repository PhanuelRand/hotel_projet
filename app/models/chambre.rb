class Chambre < ActiveRecord::Base
  attr_accessible :name, :image_url, :numero, :type_chambre_id, :type_vue_id

  has_many :reservation_chambres
  has_many :reservations, through: :reservation_chambres 

  belongs_to :type_chambre
  belongs_to :type_vue

  def get_type_chambre
    if self.type_chambre != nil
      self.type_chambre.type_de_chambre
    end
  end

  def get_type_vue
    if self.type_vue != nil
      self.type_vue.type_de_vue
    end
  end

  def get_price
    if self.type_vue != nil
      self.type_vue.price + self.type_chambre.price
    end
  end
end
