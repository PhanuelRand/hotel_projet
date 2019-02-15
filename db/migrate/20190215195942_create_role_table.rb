class CreateRoleTable < ActiveRecord::Migration
  def change
    create_table :role do |t|
      t.string :role_type

      t.timestamps
    end
  end
end
