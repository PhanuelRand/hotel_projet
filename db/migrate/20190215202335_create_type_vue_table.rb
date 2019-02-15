class CreateTypeVueTable < ActiveRecord::Migration
  def change
    create_table :type_vue do |t|
      t.string :type_de_vue

      t.timestamps
    end
  end
end
