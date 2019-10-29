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

ActiveRecord::Schema.define(version: 2019_10_29_053335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.bigint "people_id"
    t.boolean "is_boost_match"
    t.boolean "is_closed"
    t.boolean "is_dead"
    t.boolean "is_fast_match"
    t.boolean "is_following"
    t.boolean "is_following_moments"
    t.boolean "is_muted"
    t.boolean "is_pending"
    t.boolean "is_super_like"
    t.integer "common_friend_count"
    t.integer "common_like_count"
    t.string "last_active_at"
    t.string "matched_at"
    t.string "participants"
    t.string "readreceipt"
    t.string "seen"
    t.string "tinder_match_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "person_id"
    t.index ["people_id"], name: "index_matches_on_people_id"
    t.index ["person_id"], name: "index_matches_on_person_id"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "sent_at"
    t.integer "from_id"
    t.integer "person_id"
    t.integer "reply_id"
    t.integer "to_id"
    t.string "tinder_id"
    t.string "tinder_match_id"
    t.string "tinder_message_id"
    t.text "content"
    t.datetime "tinder_timestamp"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.date "birthdate"
    t.integer "distance_mi"
    t.string "gender"
    t.string "instagram_id"
    t.string "instagram_username"
    t.string "name"
    t.text "bio"
    t.text "common_friends"
    t.text "instagram_photos"
    t.text "jobs"
    t.text "photos"
    t.text "schools"
    t.text "teaser"
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
    t.datetime "imported_at"
    t.json "data"
    t.string "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "matches", "people"
end
