class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :itme_price
      t.text :description
      t.integer :item_category
      t.text :self_description
      t.integer :pickup_id
      t.integer :admin_id, foreign_key: true
      t.timestamps
    end
  end
end
