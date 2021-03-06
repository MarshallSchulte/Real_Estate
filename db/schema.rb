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

ActiveRecord::Schema.define(version: 20140303064818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "cover"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "listing_token"
    t.integer  "listing_id"
  end

  create_table "listings", force: true do |t|
    t.string   "address"
    t.integer  "price"
    t.integer  "beds"
    t.integer  "bathrooms"
    t.integer  "sqft"
    t.text     "addinfo"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "category"
    t.string   "token"
    t.integer  "cover"
    t.integer  "lotsize"
    t.string   "yearbuilt"
    t.string   "type"
    t.integer  "floors"
    t.string   "occupied"
    t.string   "deck"
    t.string   "garage"
    t.string   "pool"
    t.string   "basement"
    t.string   "fireplace"
    t.string   "backyard"
    t.string   "county"
    t.string   "subdivision"
    t.string   "ac"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "pictures", force: true do |t|
    t.string   "description"
    t.string   "image"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gallery_token"
    t.string   "listing_token"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
