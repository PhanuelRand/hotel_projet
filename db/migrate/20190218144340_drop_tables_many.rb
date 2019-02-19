class DropTablesMany < ActiveRecord::Migration
  def change
    drop_table :type_chambre
    drop_table :type_vue
    drop_table :role
    drop_table :user_role
  end
end
