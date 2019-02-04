class CreateReservationChambres < ActiveRecord::Migration
  def change
    create_table :reservation_chambres do |t|
      t.integer :reservation_id
      t.integer :chambre_id
    end
  end
end
