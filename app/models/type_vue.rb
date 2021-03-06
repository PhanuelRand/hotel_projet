class TypeVue < ActiveRecord::Base
  attr_accessible :chambre_id, :type_de_vue

  has_many :chambres

  validates :chambre_id, presence: true
  validates :type_de_vue, presence: true
end
