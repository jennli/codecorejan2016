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

ActiveRecord::Schema.define(version: 20160401234430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartment_listings", force: :cascade do |t|
    t.string   "title"
    t.string   "pic_1"
    t.text     "description"
    t.integer  "daily_price"
    t.integer  "monthly_price"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "address"
    t.string   "city"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "country"
    t.string   "province"
  end

  add_index "apartment_listings", ["user_id"], name: "index_apartment_listings_on_user_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "price"
    t.date     "checkin_date"
    t.date     "checkout_date"
    t.integer  "user_id"
    t.integer  "apartment_listing_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "rate_type"
  end

  add_index "reservations", ["apartment_listing_id"], name: "index_reservations_on_apartment_listing_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "apartment_listings", "users"
  add_foreign_key "reservations", "apartment_listings"
  add_foreign_key "reservations", "users"
end
