class TypeChambre < ActiveRecord::Base
  attr_accessible :chambre_id, :type_de_chambre

  has_many :chambres
end
