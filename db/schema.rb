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

ActiveRecord::Schema.define(version: 20180303203918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boleto_payments", force: :cascade do |t|
    t.string "boleto_number"
    t.bigint "payment_id"
    t.index ["payment_id"], name: "index_boleto_payments_on_payment_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "cpf"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string "holder_name"
    t.string "number"
    t.date "expiration_date"
    t.integer "cvv"
    t.integer "buyer_id"
  end

  create_table "checkouts", force: :cascade do |t|
  end

  create_table "clients", force: :cascade do |t|
  end

  create_table "credit_card_payments", force: :cascade do |t|
    t.integer "card_id"
    t.bigint "payment_id"
    t.index ["payment_id"], name: "index_credit_card_payments_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.text "payment_hash"
    t.integer "status"
    t.integer "method"
    t.decimal "amount"
    t.integer "client_id"
    t.integer "buyer_id"
  end

  add_foreign_key "boleto_payments", "payments"
  add_foreign_key "credit_card_payments", "cards"
  add_foreign_key "credit_card_payments", "payments"
end
