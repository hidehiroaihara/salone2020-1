class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :stylist_id, null: false, foreign_key: true
      t.integer :seat_id, null: false
      t.time :time, null: false
      t.date :date, null: false
      t.integer :menu_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.integer :status_id, null: false
      t.integer :salon_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
