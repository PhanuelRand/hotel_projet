class CreateChambres < ActiveRecord::Migration
  def change
    create_table :chambres do |t|
      t.string :name
      t.string :type
      t.string :vue

      t.timestamps
    end
  end
end
