class CreateUserOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_options do |t|
      t.integer :menu_time_id,                    default: 0
      t.integer :menu_id,      foreign_key: true, default: 0
      t.integer :user_id,      foreign_key: true
      t.timestamps
    end
  end
end
