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

ActiveRecord::Schema.define(version: 2018_10_01_162756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "reservation_id"
    t.index ["owner_id"], name: "index_answers_on_owner_id"
    t.index ["reservation_id"], name: "index_answers_on_reservation_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "topic_id"
    t.index ["photo_id"], name: "index_posts_on_photo_id"
    t.index ["topic_id"], name: "index_posts_on_topic_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "owner_id"
    t.date "start_date"
    t.date "end_date"
    t.text "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "answer_id"
    t.index ["answer_id"], name: "index_reservations_on_answer_id"
    t.index ["owner_id"], name: "index_reservations_on_owner_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.integer "owner_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "info"
    t.index ["owner_id"], name: "index_topics_on_owner_id"
    t.index ["post_id"], name: "index_topics_on_post_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "parent"
    t.string "name"
    t.string "admin", default: "f"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "reservations"
  add_foreign_key "answers", "users", column: "owner_id"
  add_foreign_key "posts", "photos"
  add_foreign_key "posts", "topics"
  add_foreign_key "reservations", "answers"
  add_foreign_key "reservations", "users", column: "owner_id"
  add_foreign_key "topics", "posts"
  add_foreign_key "topics", "users", column: "owner_id"
end
