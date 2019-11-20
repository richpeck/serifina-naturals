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

ActiveRecord::Schema.define(version: 2014_04_13_221390) do

  create_table "associations", force: :cascade do |t|
    t.string "associatiable_type"
    t.integer "associatiable_id"
    t.string "associated_type"
    t.integer "associated_id"
    t.index ["associated_type", "associated_id"], name: "index_associations_on_associated_type_and_associated_id"
    t.index ["associatiable_type", "associatiable_id", "associated_type", "associated_id"], name: "association_index", unique: true
    t.index ["associatiable_type", "associatiable_id"], name: "index_associations_on_associatiable_type_and_associatiable_id"
  end

  create_table "charms", force: :cascade do |t|
    t.integer "charm_type_id"
    t.string "name"
    t.integer "price"
    t.index ["charm_type_id", "name"], name: "charm_type_id_name_index", unique: true
  end

  create_table "nodes", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.index ["type", "name"], name: "type_name_index", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "product_id", limit: 8
    t.string "product_type"
    t.string "title"
    t.string "vendor"
    t.string "sku"
    t.string "image"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id", "product_id"], name: "shop_products_unique_index", unique: true
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "shapes", force: :cascade do |t|
    t.integer "bail_type", default: 0
    t.integer "shape_type_id", default: 0
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.index ["bail_type", "shape_type_id", "name"], name: "bail_shop_name_unique_index", unique: true
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "token_encrypted"
    t.index ["name"], name: "index_shops_on_name", unique: true
  end

  create_table "stones", force: :cascade do |t|
    t.integer "stone_type_id", default: 0
    t.string "name"
    t.integer "price"
    t.index ["stone_type_id", "name"], name: "stone_type_name_index", unique: true
  end

end
