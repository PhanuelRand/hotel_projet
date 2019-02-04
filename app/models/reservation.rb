class Reservation < ActiveRecord::Base
  attr_accessible :nombre_chambre, :reservation_chambre_id, :date_arrive, :date_depart, :demande_particuliere, :price, :type_de_chambre, :type_de_vue, :user_age, :user_email, :user_id, :user_name

  belongs_to :user
  # belongs_to :reservation_chambre

  has_many :reservation_chambres
  has_many :chambres, through: :reservation_chambres
end
