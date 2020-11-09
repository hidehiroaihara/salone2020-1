class CreateShiftSalons < ActiveRecord::Migration[6.0]
  def change
    create_table :shift_salons do |t|
      t.date :holiday,        null: false
      t.timestamps
    end
  end
end
