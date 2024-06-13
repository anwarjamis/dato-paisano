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

ActiveRecord::Schema[7.0].define(version: 2024_05_12_013349) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "email"
    t.string "link"
    t.string "instagram"
    t.string "facebook"
    t.string "tiktok"
    t.integer "phone"
    t.bigint "user_id", null: false
    t.bigint "type_id", null: false
    t.bigint "subcategory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcategory_id"], name: "index_businesses_on_subcategory_id"
    t.index ["type_id"], name: "index_businesses_on_type_id"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "origens", force: :cascade do |t|
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "networking"
    t.boolean "mentoring"
    t.boolean "partnership"
    t.boolean "investors"
    t.boolean "subsidies"
    t.boolean "growth"
    t.boolean "start"
    t.boolean "others"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "first_last_name"
    t.string "second_last_name"
    t.date "birth"
    t.integer "phone"
    t.bigint "gender_id", null: false
    t.bigint "origen_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["gender_id"], name: "index_users_on_gender_id"
    t.index ["origen_id"], name: "index_users_on_origen_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "businesses", "subcategories"
  add_foreign_key "businesses", "types"
  add_foreign_key "businesses", "users"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "suggestions", "users"
  add_foreign_key "users", "genders"
  add_foreign_key "users", "origens"
end
