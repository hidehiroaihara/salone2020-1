class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :menu_name,        null: false
      t.integer :price,           null: false 
      t.integer :customer_type_id
      t.text :menu_text,          null: false
      t.time :menu_time
      t.timestamps
    end
  end
end