class ChangeTypeChambreName < ActiveRecord::Migration
  def up
    rename_column :chambres, :type_chambre_price, :vue_jungle_price
    rename_column :chambres, :vue_chambre_price, :vue_mer_price
  end
end
