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

ActiveRecord::Schema.define(version: 20140610192438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "floors", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.boolean  "is_owned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "floors_jobs", id: false, force: true do |t|
    t.integer "floors_id"
    t.integer "jobs_id"
  end

  create_table "jobs", force: true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missions", force: true do |t|
    t.string   "name"
    t.integer  "reward"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_complete", default: false
  end

  create_table "missions_jobs", id: false, force: true do |t|
    t.integer "missions_id"
    t.integer "jobs_id"
    t.integer "job_quantity"
  end

  add_index "missions_jobs", ["jobs_id"], name: "index_missions_jobs_on_jobs_id", using: :btree
  add_index "missions_jobs", ["missions_id"], name: "index_missions_jobs_on_missions_id", using: :btree

end
