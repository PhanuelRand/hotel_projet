class AddPriceTotalToChambres < ActiveRecord::Migration
  def change
    add_column :chambres, :price_total, :decimal, :precision => 8, :scale => 2
  end
end
