class CreateSalons < ActiveRecord::Migration[6.0]
  def change
    create_table :salons do |t|
      t.time :start_time,    null: false
      t.time :end_time,      null: false
      t.date :holiday         
      t.timestamps
    end
  end
end
