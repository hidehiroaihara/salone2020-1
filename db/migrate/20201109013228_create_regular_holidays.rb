class CreateRegularHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :regular_holidays do |t|
      t.string :name
      t.integer :num
      t.timestamps
    end
  end
end
