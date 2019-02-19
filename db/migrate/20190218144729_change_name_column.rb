class ChangeNameColumn < ActiveRecord::Migration
  def change
    rename_column :type_vues, :chmabre_id, :chambre_id
    rename_column :type_chambres, :chmabre_id, :chambre_id
    rename_column :chambres, :iamge_url, :image_url
  end
end
