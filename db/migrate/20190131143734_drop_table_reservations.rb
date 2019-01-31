class DropTableReservations < ActiveRecord::Migration
  def change
    drop_table :reservations
  end
end
