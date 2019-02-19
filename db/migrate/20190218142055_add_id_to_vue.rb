class AddIdToVue < ActiveRecord::Migration
  def change
    add_column :type_chambre, :id_chambre, :integer
    add_column :type_vue, :id_chambre, :integer
  end
end
