class Chambre < ActiveRecord::Base
  attr_accessible :name, :type_chambre, :vue, :image, :price, :numero

  has_many :reservations
  has_many :users, :through => :reservations
end
