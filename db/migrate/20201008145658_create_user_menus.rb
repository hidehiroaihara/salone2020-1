class CreateUserMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :user_menus do |t|
      t.integer :menu_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
