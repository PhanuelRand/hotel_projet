class Chambre < ActiveRecord::Base
  attr_accessible :name, :type_chambre, :vue, :image, :price, :numero, :vue_jungle_price, :vue_mer_price, :price_total

  has_many :reservation_chambres
  has_many :reservations, through: :reservation_chambres 
end
