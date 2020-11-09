class CreateStylists < ActiveRecord::Migration[6.0]
  def change
    create_table :stylists do |t|
      t.string :stylist_first_name,       null: false
      t.string :stylist_last_name,        null: false
      t.string :stylist_first_name_cana,  null: false
      t.string :stylist_last_name_cana,   null: false
      t.integer :rank_id,                 null: false, default: 0
      t.integer :gender_id,               null: false, default: 0
      t.string :catchphrase,              null: false
      t.string :self_introduction,        null: false
      t.integer :admin_id,                foreign_key: true
      t.timestamps 
    end
  end
end
