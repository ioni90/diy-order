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

ActiveRecord::Schema.define(version: 2020_11_17_112355) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "postal_code", null: false
    t.integer "prefecture_id", null: false
    t.string "location", null: false
    t.string "building"
    t.string "phone", null: false
    t.bigint "closure_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["closure_id"], name: "index_addresses_on_closure_id"
  end

  create_table "bids", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "user_id", null: false
    t.boolean "price_ok", default: false, null: false
    t.boolean "size_ok", default: false, null: false
    t.boolean "material_ok", default: false, null: false
    t.boolean "detail_ok", default: false, null: false
    t.boolean "delivery_ok", default: false, null: false
    t.text "price_remark", null: false
    t.text "size_remark", null: false
    t.text "material_remark", null: false
    t.text "detail_remark", null: false
    t.text "delivery_time_remark", null: false
    t.text "message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "offer_price"
    t.index ["order_id"], name: "index_bids_on_order_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "closures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "bid_id", null: false
    t.text "reply", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bid_id"], name: "index_closures_on_bid_id"
    t.index ["order_id"], name: "index_closures_on_order_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "story", null: false
    t.integer "type_id", null: false
    t.integer "price", null: false
    t.string "size", null: false
    t.text "material"
    t.text "detail"
    t.integer "delivery_time_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "closures"
  add_foreign_key "bids", "orders"
  add_foreign_key "bids", "users"
  add_foreign_key "closures", "bids"
  add_foreign_key "closures", "orders"
  add_foreign_key "orders", "users"
end
