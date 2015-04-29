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

ActiveRecord::Schema.define(version: 20150429075859) do

  create_table "contact_people", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.integer  "site_id"
  end

  add_index "contact_people", ["organization_id"], name: "index_contact_people_on_organization_id"
  add_index "contact_people", ["site_id"], name: "index_contact_people_on_site_id"

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.integer  "status"
    t.integer  "organization_id"
  end

  add_index "items", ["organization_id"], name: "index_items_on_organization_id"

  create_table "needed_items", force: true do |t|
    t.string   "name"
    t.string   "needed_item_type"
    t.integer  "priority"
    t.string   "status"
    t.integer  "quantity"
    t.date     "expected_date"
    t.date     "delivered_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  add_index "needed_items", ["site_id"], name: "index_needed_items_on_site_id"

  create_table "news", force: true do |t|
    t.datetime "published_at"
    t.string   "source"
    t.string   "author"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zone"
    t.string   "district"
    t.string   "city"
    t.string   "address_1"
    t.string   "address_2"
    t.decimal  "latitude"
    t.decimal  "longitude"
  end

  create_table "sites", force: true do |t|
    t.string   "name"
    t.string   "zone"
    t.string   "district"
    t.string   "address1"
    t.string   "address2"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "severity"
    t.integer  "population"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "safe"
    t.integer  "injured"
    t.integer  "dead"
    t.boolean  "road_access"
    t.decimal  "nearest_road"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.boolean  "approved"
  end

  add_index "users", ["approved"], name: "index_users_on_approved"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
