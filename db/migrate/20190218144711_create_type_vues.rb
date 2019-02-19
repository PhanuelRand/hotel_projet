class CreateTypeVues < ActiveRecord::Migration
  def change
    create_table :type_vues do |t|
      t.string :type_de_vue
      t.integer :chmabre_id

      t.timestamps
    end
  end
end
