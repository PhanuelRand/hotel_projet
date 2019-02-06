class AddListsChambre < ActiveRecord::Migration
  def change
    add_column :reservations, :list_chambres, :string 
  end
end
