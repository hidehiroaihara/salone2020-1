class CreateSalonRegularHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :salon_regular_holidays do |t|
      t.integer :regular_holiday_id,   foreign_key: true
      t.integer :salon_id,             foreign_key: true
      t.timestamps
    end
  end
end
