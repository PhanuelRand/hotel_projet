class TypeChambre < ActiveRecord::Base
    attr_accessible :type_de_chambre
  
    has_many :chambres
end