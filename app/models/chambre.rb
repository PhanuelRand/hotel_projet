class Chambre < ActiveRecord::Base
  attr_accessible :name, :image_url, :numero, :type_chambre_id, :type_vue_id

  has_many :reservation_chambres
  has_many :reservations, through: :reservation_chambres 

  belongs_to :type_chambre
  belongs_to :type_vue


  validates :name, presence: true
  validates :image_url, presence: true
  validates :numero, presence: true
  validates :type_chambre_id, presence: true
  validates :type_vue_id, presence: true

  def get_type_chambre
    self.type_chambre.type_de_chambre
  end

  def get_type_vue
    self.type_vue.type_de_vue
  end

  def get_price
    self.type_vue.price + self.type_chambre.price
  end
end
