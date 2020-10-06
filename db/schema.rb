# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_06_144154) do

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_cana", null: false
    t.string "last_name_cana", null: false
    t.date "birthday", null: false
    t.string "phone_number", null: false
    t.integer "gender_id"
    t.integer "stylist_id"
    t.integer "blood_type_id"
    t.integer "job_id"
    t.text "customer_text"
    t.integer "member_id"
    t.integer "customer_number"
    t.integer "age_id"
    t.string "post_code"
    t.integer "prefecture_id"
    t.string "address_all"
    t.date "information_date"
    t.text "information_text"
    t.integer "visit_time"
    t.integer "consent_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
