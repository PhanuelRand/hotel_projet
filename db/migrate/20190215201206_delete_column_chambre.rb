class DeleteColumnChambre < ActiveRecord::Migration
  def change
    rename_column :chambres, :image, :iamge_url
    remove_column :chambres, :type_chambre
    remove_column :chambres, :vue
    remove_column :chambres, :price
    remove_column :chambres, :vue_jungle_price
    remove_column :chambres, :vue_mer_price


    remove_column :reservations, :list_chambres
    remove_column :reservations, :numero_chambre
    remove_column :reservations, :nombre_chambre
    remove_column :reservations, :reservation_chambre_id
    remove_column :reservations, :price
    remove_column :reservations, :type_de_chambre
    remove_column :reservations, :type_de_vue
  end
end
