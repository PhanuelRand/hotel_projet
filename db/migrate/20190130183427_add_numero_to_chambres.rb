class AddNumeroToChambres < ActiveRecord::Migration
  def change
    add_column :chambres, :numero, :integer
  end
end
