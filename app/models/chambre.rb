class Chambre < ActiveRecord::Base
  attr_accessible :name, :type_chambre, :vue, :image, :price, :numero

  has_many :reservation_chambres
  has_many :reservations, through: :reservation_chambres 
end
