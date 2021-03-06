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

ActiveRecord::Schema.define(version: 20190619232005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "comment"
    t.string   "name_whom_add_comment"
    t.integer  "user_id"
    t.integer  "tweet_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["tweet_id"], name: "index_comments_on_tweet_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "your_likes",         null: false
    t.string   "name_whom_add_like", null: false
    t.integer  "user_id"
    t.integer  "tweet_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "comment_id"
    t.index ["comment_id"], name: "index_likes_on_comment_id", using: :btree
    t.index ["tweet_id"], name: "index_likes_on_tweet_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string   "full_name",    null: false
    t.integer  "gender",       null: false
    t.string   "adress",       null: false
    t.string   "phone_number", null: false
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "tweets"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "comments"
  add_foreign_key "likes", "tweets"
  add_foreign_key "likes", "users"
  add_foreign_key "user_profiles", "users"
end
