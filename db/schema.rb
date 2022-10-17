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

ActiveRecord::Schema.define(version: 2022_10_11_212836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aquaria", force: :cascade do |t|
    t.string "name"
    t.boolean "has_real_plants"
    t.float "gallons"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chickens", force: :cascade do |t|
    t.string "name"
    t.boolean "is_broody"
    t.integer "clutch_count"
    t.bigint "coop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coop_id"], name: "index_chickens_on_coop_id"
  end

  create_table "coops", force: :cascade do |t|
    t.string "name"
    t.boolean "is_portable"
    t.integer "nest_box_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shrimps", force: :cascade do |t|
    t.string "name"
    t.float "length_in_cm"
    t.boolean "is_female"
    t.string "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "aquarium_id"
    t.index ["aquarium_id"], name: "index_shrimps_on_aquarium_id"
  end

  add_foreign_key "chickens", "coops"
  add_foreign_key "shrimps", "aquaria"
end
