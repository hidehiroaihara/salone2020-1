class CreateSalonShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :salon_shifts do |t|
      t.integer :shift_salon_id,  foreign_key: true
      t.integer :salon_id,        foreign_key: true
      t.timestamps
    end
  end
end
