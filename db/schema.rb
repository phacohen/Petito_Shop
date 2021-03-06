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

ActiveRecord::Schema.define(version: 20170216235041) do

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "quantity"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "products_in_cart_id"
    t.string   "name"
    t.decimal  "price",               precision: 12, scale: 3
    t.string   "category"
    t.integer  "stock"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["products_in_cart_id"], name: "index_products_on_products_in_cart_id"
  end

  create_table "products_in_carts", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "total_quantity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["cart_id"], name: "index_products_in_carts_on_cart_id"
    t.index ["product_id"], name: "index_products_in_carts_on_product_id"
  end

  create_table "registered_pets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "pet_name"
    t.integer  "pet_age"
    t.string   "pet_disease"
    t.string   "pet_vaccines"
    t.text     "pet_info"
    t.string   "owner_name"
    t.string   "owner_phone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_registered_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.boolean  "admin",             default: false
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
