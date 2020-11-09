class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.date :holiday,     null: false
      t.timestamps
    end
  end
end
