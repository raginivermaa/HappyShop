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

ActiveRecord::Schema.define(version: 2018_05_11_041924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer "parent_id"
    t.string "label", null: false
    t.string "slug_url"
    t.string "state", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name", null: false
    t.string "slug_url", null: false
    t.string "description", null: false
    t.string "state", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "variants", force: :cascade do |t|
    t.bigint "product_id"
    t.string "name"
    t.boolean "sold_out"
    t.boolean "under_sale"
    t.integer "price"
    t.integer "sale_price"
    t.string "sale_text"
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "products", "categories"
  add_foreign_key "variants", "products"
end
