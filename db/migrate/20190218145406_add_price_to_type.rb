class AddPriceToType < ActiveRecord::Migration
  def change
    add_column :type_chambres, :price, :decimal, :precision => 8, :scale => 2
    add_column :type_vues, :price, :decimal, :precision => 8, :scale => 2
  end
end
