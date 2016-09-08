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

ActiveRecord::Schema.define(version: 20160908160809) do

  create_table "comments", force: :cascade do |t|
    t.string   "message",    limit: 255
    t.string   "respond",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "topic_id",   limit: 4
  end

  add_index "comments", ["topic_id"], name: "index_comments_on_topic_id", using: :btree

  create_table "communities", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "parks", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "ubication",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "community_id", limit: 4
  end

  add_index "parks", ["community_id"], name: "index_parks_on_community_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "park_id",     limit: 4
  end

  add_index "services", ["park_id"], name: "index_services_on_park_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "comments", "topics"
  add_foreign_key "parks", "communities"
  add_foreign_key "services", "parks"
end