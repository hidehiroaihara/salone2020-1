class CreateStyleCategoryLists < ActiveRecord::Migration[6.0]
  def change
    create_table :style_category_lists do |t|
      t.string :name
      t.timestamps
    end
  end
end
