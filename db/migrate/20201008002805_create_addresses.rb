class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code        
      t.integer :prefecture_id, default: 0
      t.string :address_all
      t.integer :user_id,         foreign_key: true
      t.timestamps
    end
  end
end
