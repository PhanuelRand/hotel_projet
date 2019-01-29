class AddPriceToChambre < ActiveRecord::Migration
  def change
    add_column :chambres, :price, :decimal, :precision => 8, :scale => 2
  end
end
