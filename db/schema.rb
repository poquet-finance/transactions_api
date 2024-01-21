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

ActiveRecord::Schema[7.1].define(version: 2024_01_21_123430) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bank_code", null: false
    t.integer "banking_type", default: 0, null: false
  end

  create_table "financial_instruments", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "bank_id"
    t.decimal "balance", default: "0.0", null: false
    t.integer "instrument_type", default: 0, null: false
    t.bigint "identifier", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_financial_instruments_on_bank_id"
    t.index ["person_id"], name: "index_financial_instruments_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "identifier", default: "", null: false
    t.string "name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "financial_instrument_id"
    t.string "desctiption"
    t.string "branch"
    t.string "quota"
    t.string "doc_number"
    t.integer "number_of_payments"
    t.bigint "identifier"
    t.decimal "total", null: false
    t.datetime "date", null: false
    t.decimal "in", null: false
    t.decimal "out", null: false
    t.integer "currency", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["financial_instrument_id"], name: "index_transactions_on_financial_instrument_id"
    t.index ["person_id"], name: "index_transactions_on_person_id"
  end

end
