class DropTable < ActiveRecord::Migration
  def change
    drop_table :type_chambre
    drop_table :chambre_reserves
    drop_table :role
    drop_table :user_role
  end
end
