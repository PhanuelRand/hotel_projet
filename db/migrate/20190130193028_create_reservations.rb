class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user
      t.references :chambre
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
    add_index :reservations, :user_id
    add_index :reservations, :chambre_id
  end
end
