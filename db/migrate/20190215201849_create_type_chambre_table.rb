class CreateTypeChambreTable < ActiveRecord::Migration
  def change
    create_table :type_chambre do |t|
      t.string :type_de_chambre

      t.timestamps
    end
  end
end
