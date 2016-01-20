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

ActiveRecord::Schema.define(version: 20160119160953) do

  create_table "jobs", force: :cascade do |t|
    t.string   "current_location"
    t.string   "destination"
    t.integer  "containers_needed"
    t.decimal  "cost"
    t.text     "cargo"
    t.integer  "ship_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "job_name"
    t.string   "ship_name"
  end

  add_index "jobs", ["ship_id"], name: "index_jobs_on_ship_id"

  create_table "locations", force: :cascade do |t|
    t.string   "local_name"
    t.integer  "ship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["ship_id"], name: "index_locations_on_ship_id"

  create_table "ships", force: :cascade do |t|
    t.string   "name"
    t.float    "length"
    t.string   "location"
    t.string   "ship_type"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "container_no"
    t.integer  "job_id"
  end

  add_index "ships", ["job_id"], name: "index_ships_on_job_id"
  add_index "ships", ["user_id"], name: "index_ships_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "fname"
    t.string   "lname"
  end

end
