class CreateChambreReserves < ActiveRecord::Migration
  def change
    create_table :chambre_reserves do |t|
      t.integer :chambre_id

      t.timestamps
    end
    add_index :chambre_reserves, [:chambre_id, :created_at]
  end
end
