class CreateSpcialHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :spcial_holidays do |t|
      t.date :holiday,      null: false
      t.timestamps
    end
  end
end
