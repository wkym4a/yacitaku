# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_26_041947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "owners", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "post_code", null: false
    t.string "address", null: false
    t.string "tel", null: false
    t.string "tel2", null: false
    t.string "fax", null: false
    t.string "property_name", null: false
    t.string "property_name_kana", null: false
    t.string "property_post_code", null: false
    t.string "property_address", null: false
    t.string "property_type", null: false
    t.string "bank", null: false
    t.string "branch", null: false
    t.integer "account_type", default: 0, null: false
    t.string "account_num", null: false
    t.string "account_name", null: false
    t.text "memo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.integer "div", null: false
    t.boolean "admin_flg", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["div"], name: "index_roles_on_div", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name", default: "", null: false
    t.string "account_name", default: "", null: false
    t.integer "email_public_div", default: 9, null: false
    t.text "profile", default: "", null: false
    t.integer "public_div", default: 0, null: false
    t.integer "pin_public_div_default", default: 0, null: false
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "users", "roles"
end
