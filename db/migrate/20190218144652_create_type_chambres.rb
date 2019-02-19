class CreateTypeChambres < ActiveRecord::Migration
  def change
    create_table :type_chambres do |t|
      t.string :type_de_chambre
      t.integer :chmabre_id

      t.timestamps
    end
  end
end
