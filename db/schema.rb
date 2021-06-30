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

ActiveRecord::Schema.define(version: 2021_06_29_092944) do

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.text "details"
    t.string "firstname"
    t.string "lastname"
    t.string "photo"
    t.integer "supporting_id"
    t.integer "gender_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["gender_id"], name: "index_accounts_on_gender_id"
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["supporting_id"], name: "index_accounts_on_supporting_id"
  end

  create_table "dislikes", force: :cascade do |t|
    t.integer "disliker_id"
    t.integer "disliking_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disliker_id", "disliking_id"], name: "index_dislikes_on_disliker_id_and_disliking_id", unique: true
    t.index ["disliker_id"], name: "index_dislikes_on_disliker_id"
    t.index ["disliking_id"], name: "index_dislikes_on_disliking_id"
  end

  create_table "entries", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_entries_on_account_id"
    t.index ["room_id"], name: "index_entries_on_room_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interested_in_genders", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "gender_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_interested_in_genders_on_account_id"
    t.index ["gender_id"], name: "index_interested_in_genders_on_gender_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "account_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "read", default: false
    t.index ["account_id"], name: "index_messages_on_account_id"
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "new_matchings", force: :cascade do |t|
    t.integer "account_id"
    t.integer "friend_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_new_matchings_on_account_id"
    t.index ["friend_id"], name: "index_new_matchings_on_friend_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["following_id"], name: "index_relationships_on_following_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "supportings", force: :cascade do |t|
    t.string "team"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accounts", "genders"
  add_foreign_key "accounts", "supportings"
  add_foreign_key "entries", "accounts"
  add_foreign_key "entries", "rooms"
  add_foreign_key "interested_in_genders", "accounts"
  add_foreign_key "interested_in_genders", "genders"
  add_foreign_key "messages", "accounts"
  add_foreign_key "messages", "rooms"
end
