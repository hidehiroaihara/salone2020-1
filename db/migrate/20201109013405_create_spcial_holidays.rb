class CreateSpcialHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :spcial_holidays do |t|
      t.date :holiday,      null: false
      t.integer :salon_id,  foreign_key: true
      t.timestamps
    end
  end
end
