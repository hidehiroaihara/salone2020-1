class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.date :holiday,           null: false
      t.integer :salon_id,       foreign_key: true
      t.timestamps
    end
  end
end
