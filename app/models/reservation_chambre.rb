class ReservationChambre < ActiveRecord::Base
    attr_accessible :reservation_id, :chambre_id

    # has_many :reservations
    # has_many :users, through: :reservations

    belongs_to :chambre
    belongs_to :reservation

    validates :reservation_id, presence: true
    validates :chambre_id, presence: true
  
end
