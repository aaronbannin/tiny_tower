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

ActiveRecord::Schema.define(version: 20140615040704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "floors", force: true do |t|
    t.string   "floor_type"
    t.string   "name"
    t.boolean  "is_owned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "floors_jobs", id: false, force: true do |t|
    t.integer "floor_id"
    t.integer "job_id"
  end

  create_table "jobs", force: true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs_missions", id: false, force: true do |t|
    t.integer "mission_id"
    t.integer "job_id"
    t.integer "job_quantity"
  end

  add_index "jobs_missions", ["job_id"], name: "index_jobs_missions_on_job_id", using: :btree
  add_index "jobs_missions", ["mission_id"], name: "index_jobs_missions_on_mission_id", using: :btree

  create_table "missions", force: true do |t|
    t.string   "name"
    t.integer  "reward"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_complete", default: false
  end

end
