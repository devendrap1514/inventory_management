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

ActiveRecord::Schema[7.0].define(version: 2023_08_17_035728) do
  create_table "carts", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "product_variant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_carts_on_customer_id"
    t.index ["product_variant_id"], name: "index_carts_on_product_variant_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name", limit: 2, null: false
    t.string "last_name", limit: 2, null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_variants", force: :cascade do |t|
    t.integer "length", null: false
    t.integer "width", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "brand_name", null: false
    t.integer "vendor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "first_name", limit: 2, null: false
    t.string "last_name", limit: 2, null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "carts", "customers"
  add_foreign_key "carts", "product_variants"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "vendors"
end
