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

ActiveRecord::Schema.define(version: 20150925232204) do

  create_table "datasets", force: :cascade do |t|
    t.string   "rankings_filename"
    t.string   "salaries_filename"
    t.string   "rankings"
    t.string   "salaries"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.integer  "salary"
    t.float    "projected_points"
    t.float    "price_per_point"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "dataset_id"
  end

  add_index "players", ["dataset_id"], name: "index_players_on_dataset_id"

end
