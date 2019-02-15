class Chambre < ActiveRecord::Base
  attr_accessible :name, :vue, :image_url, :numero

  has_many :reservation_chambres
  has_many :reservations, through: :reservation_chambres 

  belongs_to :type_chambre
  belongs_to :type_vue
end
