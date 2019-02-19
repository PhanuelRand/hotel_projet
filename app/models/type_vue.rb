class TypeVue < ActiveRecord::Base
  attr_accessible :chambre_id, :type_de_vue

  has_many :chambres
end
