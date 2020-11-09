class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :stylist_id, null: false, foreign_key: true
      t.integer :seat,    default: 1
      t.time :time, null: false
      t.date :date, null: false
      t.integer :menu_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.integer :status_id, default: 1
      t.integer :salon_id, null: false, foreign_key: true
      t.datetime :menu_start_time
      t.datetime :menu_end_time
      t.integer :set_price, null: false 
      t.integer :admin_id, foreign_key: true
      t.timestamps
    end
  end
end
