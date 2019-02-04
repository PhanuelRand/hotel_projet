class CreateReservation < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :reservation_chambre_id
      t.string :nombre_chambre
      t.string :user_name
      t.string :user_email
      t.integer :user_age
      t.string :type_de_chambre
      t.string :type_de_vue
      t.datetime :date_arrive
      t.datetime :date_depart
      t.text :demande_particuliere
      t.decimal :price

      t.timestamps
    end
  end
end
