class ChangeNumeroType < ActiveRecord::Migration
  def change
    change_column :chambres, :numero, :string
  end
end
