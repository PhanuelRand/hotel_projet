class DropTables < ActiveRecord::Migration
  def change
    drop_table :chambre_reserves
  end
end
