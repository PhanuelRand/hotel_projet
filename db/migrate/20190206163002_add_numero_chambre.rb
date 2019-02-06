class AddNumeroChambre < ActiveRecord::Migration
  def change
    add_column :reservations, :numero_chambres, :string, array: true, default: []
  end
end
