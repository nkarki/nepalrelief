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

ActiveRecord::Schema.define(version: 20150428185633) do

  create_table "contact_people", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.integer  "status"
  end

  create_table "needed_items", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "priority"
    t.string   "status"
    t.integer  "quantity"
    t.date     "expected_date"
    t.date     "delivered_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "address1"
    t.string   "address2"
    t.string   "zip"
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "sites", force: true do |t|
    t.string   "name"
    t.string   "zone"
    t.string   "district"
    t.string   "address1"
    t.string   "address2"
    t.integer  "zip"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.integer  "severity"
    t.integer  "population"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
