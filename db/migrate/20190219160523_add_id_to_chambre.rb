class AddIdToChambre < ActiveRecord::Migration
  def change
    add_column :chambres, :type_chambre_id, :integer
    add_column :chambres, :type_vue_id, :integer
  end
end
