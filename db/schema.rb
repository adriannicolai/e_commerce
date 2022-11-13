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

ActiveRecord::Schema[7.0].define(version: 2022_11_13_074133) do
  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "full_name"
    t.string "phone_number"
    t.string "province"
    t.string "city"
    t.string "detailed_address"
    t.boolean "is_billing"
    t.boolean "is_default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "image_source"
    t.boolean "is_cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "user_id", null: false
    t.string "name"
    t.text "description"
    t.text "variation_json"
    t.decimal "price", precision: 10, scale: 2
    t.decimal "cached_total_rating", precision: 1, scale: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "contact_number"
    t.date "birthday"
    t.string "email"
    t.string "password"
    t.integer "user_level", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
end
