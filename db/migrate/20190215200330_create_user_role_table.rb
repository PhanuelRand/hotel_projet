class CreateUserRoleTable < ActiveRecord::Migration
  def change
    create_table :user_role do |t|
      t.integer :user_id
      t.integer :role_id
    end
  end
end
