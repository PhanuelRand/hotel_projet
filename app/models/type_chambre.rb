class TypeChambre < ActiveRecord::Base
  attr_accessible :chambre_id, :type_de_chambre

  has_many :chambres

  validates :chambre_id, presence: true
  validates :type_de_chambre, presence: true
end
