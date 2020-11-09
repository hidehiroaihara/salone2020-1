class CreateSalons < ActiveRecord::Migration[6.0]
  def change
    create_table :salons do |t|
      t.time :start_time,         null: false
      t.time :end_time,           null: false
      t.string :salon_name,       null: false
      t.string :salon_name_cana,  null: false
      t.string :post_code,        null: false
      t.integer :prefecture_id,   null: false
      t.string :address_all,      null: false
      t.string :salon_slogan,     null: false
      t.string :salon_info,       null: false
      t.integer :admin_id,        foreign_key: true
      t.timestamps
    end
  end
end
