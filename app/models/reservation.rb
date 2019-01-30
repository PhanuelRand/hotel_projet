class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :chambre
  attr_accessible :date_arrive, :date_depart, :demande_particuliere, :price, :type_de_chambre, :type_de_vue, :user_age, :user_email, :user_name
end
