class CreateSalonSpcialHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :salon_spcial_holidays do |t|
      t.integer :salon_detail_id,       foreign_key: true
      t.integer :spcial_holiday_id, foreign_key: true
      t.timestamps
    end
  end
end
