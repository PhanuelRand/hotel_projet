class ChangeTypeInChambre < ActiveRecord::Migration
  def change
    rename_column :chambres, :type, :type_chambre
  end
end
