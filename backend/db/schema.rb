# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150921194210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "title",            null: false
    t.string   "slug"
    t.string   "description"
    t.integer  "sort_order"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "categories", ["title"], name: "index_categories_on_title", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "file_name",   null: false
    t.string   "title"
    t.string   "description"
    t.string   "meta_alt"
    t.integer  "products_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title",            null: false
    t.string   "slug"
    t.string   "description"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "products", ["title"], name: "index_products_on_title", using: :btree

  create_table "taxanomies", force: :cascade do |t|
    t.integer  "variants_id"
    t.integer  "categories_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "taxanomies", ["categories_id"], name: "index_taxanomies_on_categories_id", using: :btree
  add_index "taxanomies", ["variants_id"], name: "index_taxanomies_on_variants_id", using: :btree

  create_table "variants", force: :cascade do |t|
    t.string   "sku"
    t.string   "price"
    t.integer  "stock_level"
    t.boolean  "is_prime"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
