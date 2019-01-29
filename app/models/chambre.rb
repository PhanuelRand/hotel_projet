class Chambre < ActiveRecord::Base
  attr_accessible :name, :type_chambre, :vue, :image, :price
end
