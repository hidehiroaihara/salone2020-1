class CreateStylists < ActiveRecord::Migration[6.0]
  def change
    create_table :stylists do |t|
      t.string :stylist_first_name,       null: false
      t.string :stylist_last_name,        null: false
      t.string :stylist_first_name_cana,  null: false
      t.string :stylist_last_name_cana,   null: false
      t.integer :rank_id,                 null: false
      t.integer :gender_id,               null: false
      t.string :catchphrase,              null: false
      t.string :self_introduction,        null: false
      t.integer :stylist_number,          null: false
      t.timestamps
    end
  end
end
