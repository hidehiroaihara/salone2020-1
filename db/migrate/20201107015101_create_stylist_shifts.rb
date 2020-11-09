class CreateStylistShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :stylist_shifts do |t|
      t.integer :stylist_id, foreign_key: true
      t.integer :shift_id, foreign_key: true
      t.timestamps
    end
  end
end
