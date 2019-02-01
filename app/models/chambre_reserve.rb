class ChambreReserve < ActiveRecord::Base
  attr_accessible :chambre_id, :reservation_id

  has_many :chambres
  has_many :reservations
  has_many :users, :through => :reservations
end
