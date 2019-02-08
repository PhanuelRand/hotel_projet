class AddChampsToChambres < ActiveRecord::Migration
  def change
    add_column :chambres, :type_chambre_price, :decimal, :precision => 8, :scale => 2
    add_column :chambres, :vue_chambre_price, :decimal, :precision => 8, :scale => 2
  end
end
