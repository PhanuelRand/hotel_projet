class AddImageToChambre < ActiveRecord::Migration
  def change
    add_column :chambres, :image, :string
  end
end
