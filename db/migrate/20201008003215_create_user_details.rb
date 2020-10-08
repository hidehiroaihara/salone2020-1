class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.integer :gender_id,       default: 0
      t.integer :blood_id,        default: 0
      t.integer :job_id,          default: 0 
      t.integer :consent_id,      null: false    
      t.integer :user_id,         foreign_key: true
      t.timestamps
    end
  end
end
