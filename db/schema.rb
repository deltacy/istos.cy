# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_13_232154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "identities", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "service_topics", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id", "topic_id"], name: "index_service_topics_on_service_id_and_topic_id", unique: true
    t.index ["service_id"], name: "index_service_topics_on_service_id"
    t.index ["topic_id"], name: "index_service_topics_on_topic_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "website", null: false
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.text "information"
    t.index ["slug", "locale"], name: "index_services_on_slug_and_locale", unique: true
  end

  create_table "topics", force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.text "description"
    t.bigint "topic_id"
    t.string "locale", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug", "locale"], name: "index_topics_on_slug_and_locale", unique: true
    t.index ["topic_id"], name: "index_topics_on_topic_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "uid"
    t.string "provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "service_topics", "services"
  add_foreign_key "service_topics", "topics"
  add_foreign_key "topics", "topics"
end
