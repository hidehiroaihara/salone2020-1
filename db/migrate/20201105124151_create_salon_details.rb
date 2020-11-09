class CreateSalonDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :salon_details do |t|
      t.integer :seat_id
      t.integer :salon_id, foreign_key: true
      t.timestamps
    end
  end
end
