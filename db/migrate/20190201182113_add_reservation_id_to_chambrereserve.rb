class AddReservationIdToChambrereserve < ActiveRecord::Migration
  def change
    add_column :chambre_reserves, :reservation_id, :integer 
  end
end
