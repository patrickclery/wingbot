# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_26_235551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: :cascade do |t|
    t.date "birthdate"
    t.integer "distance_mi"
    t.string "gender"
    t.string "instagram_id"
    t.string "instagram_username"
    t.text "bio"
    t.string "name"
    t.string "common_friends"
    t.string "schools"
    t.string "teaser"
    t.string "jobs"
    t.text "photos"
    t.text "instagram_photos"
    t.string "match_id"
    t.string "tinder_id"
    t.datetime "active_at"
    t.datetime "created_at"
    t.datetime "deleted_at"
    t.datetime "muted_at"
    t.datetime "updated_at"
    t.boolean "is_traveling"
    t.boolean "hide_age"
    t.boolean "hide_distance"
  end

  create_table "raw_data", force: :cascade do |t|
    t.json "data"
    t.string "tag"
    t.datetime "imported_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
