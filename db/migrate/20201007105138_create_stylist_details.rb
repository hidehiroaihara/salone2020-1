class CreateStylistDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :stylist_details do |t|
      t.string :rank_text
      t.integer :stylist_history_id,null: false
      t.integer :nomination_id,     null: false
      t.integer :nomination_price,  default: 0
      t.integer :style_type_id,     default: 0
      t.text :style_technique
      t.text :hobby
      t.integer :stylist_id,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
