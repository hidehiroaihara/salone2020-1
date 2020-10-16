class CreateOptionLists < ActiveRecord::Migration[6.0]
  def change
    create_table :option_lists do |t|
      t.integer :user_option_id,         null: false, foreign_key: true
      t.integer :style_category_list_id, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
