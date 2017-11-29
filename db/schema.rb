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

ActiveRecord::Schema.define(version: 20171129100305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commands", force: :cascade do |t|
    t.string "state"
    t.string "order_sku"
    t.integer "amount_pennies", default: 0, null: false
    t.json "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_commands_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "raffle_id"
    t.bigint "user_id"
    t.integer "quantity"
    t.integer "total_amount"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ticket_number"
    t.boolean "won", default: false
    t.integer "price_pennies", default: 0, null: false
    t.string "sku"
    t.index ["raffle_id"], name: "index_orders_on_raffle_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "raffles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "category_name"
    t.string "brand"
    t.string "model"
    t.string "color"
    t.text "description"
    t.datetime "end_date"
    t.string "status", default: "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.integer "ticket_quantity"
    t.string "title"
    t.integer "available_tickets"
    t.integer "price_pennies", default: 0, null: false
    t.index ["user_id"], name: "index_raffles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "facebook"
    t.string "instagram"
    t.string "location"
    t.string "photo"
    t.integer "user_tickets", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "commands", "orders"
  add_foreign_key "orders", "raffles"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "raffles", "users"
end
