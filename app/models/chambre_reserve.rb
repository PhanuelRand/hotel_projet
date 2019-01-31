class ChambreReserve < ActiveRecord::Base
  attr_accessible :chambre_id

  has_many :reservations
  has_many :users, :through => :reservations
end
