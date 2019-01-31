class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :chambre_reserve_id
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
    add_index :reservations, [:user_id, :created_at]
    add_index :reservations, [:chambre_reserve_id, :created_at]
  end
end
