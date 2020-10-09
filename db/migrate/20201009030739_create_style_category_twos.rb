class CreateStyleCategoryTwos < ActiveRecord::Migration[6.0]
  def change
    create_table :style_category_twos do |t|
      t.integer :menu_id,                 null: false, foreign_key: true
      t.integer :style_category_list_id, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
