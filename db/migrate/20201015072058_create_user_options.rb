class CreateUserOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_options do |t|
      t.integer :menu_time_id
      t.integer :user_id,      foreign_key: true
      t.timestamps
    end
  end
end
