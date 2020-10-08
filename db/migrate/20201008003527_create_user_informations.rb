class CreateUserInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_informations do |t|
      t.date :information_date    
      t.text :information_text
      t.integer :visit_time      
      t.text :customer_text
      t.integer :member_id,       default: 0
      t.integer :user_id,         foreign_key: true
      t.timestamps
    end
  end
end
