class Reservation < ActiveRecord::Base
  attr_accessible :chambre_reserve_id, :date_arrive, :date_depart, :demande_particuliere, :price, :type_de_chambre, :type_de_vue, :user_age, :user_email, :user_id, :user_name

  belongs_to :user
  belongs_to :chambre_reserves
end
