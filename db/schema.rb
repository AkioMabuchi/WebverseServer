# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_28_155857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "unity202202_apps", force: :cascade do |t|
    t.string "loader_file"
    t.string "data_file"
    t.string "framework_file"
    t.string "code_file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "token", null: false
    t.string "address", null: false
    t.string "name", null: false
    t.string "password_digest"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address"], name: "index_users_on_address", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  create_table "vrms", force: :cascade do |t|
    t.string "token", null: false
    t.string "name", null: false
    t.string "body"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token"], name: "index_vrms_on_token", unique: true
    t.index ["user_id"], name: "index_vrms_on_user_id"
  end

  add_foreign_key "vrms", "users"
end
