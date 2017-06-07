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

ActiveRecord::Schema.define(version: 20170603065521) do

  create_table "checks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "spa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spa_id"], name: "index_checks_on_spa_id", using: :btree
    t.index ["user_id", "spa_id"], name: "index_checks_on_user_id_and_spa_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_checks_on_user_id", using: :btree
  end

  create_table "prefectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "jalanprefcode"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "score"
    t.integer  "user_id"
    t.integer  "spa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spa_id"], name: "index_reviews_on_spa_id", using: :btree
    t.index ["user_id", "spa_id"], name: "index_reviews_on_user_id_and_spa_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "spas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "OnsenID"
    t.string   "OnsenName"
    t.string   "OnsenNameKana"
    t.string   "OnsenAddres"
    t.string   "Prefecture"
    t.string   "NatureOfOnsen"
    t.string   "OnsenAreaURL"
    t.string   "OnsenAreaCaption"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "checks", "spas"
  add_foreign_key "checks", "users"
  add_foreign_key "reviews", "spas"
  add_foreign_key "reviews", "users"
end
