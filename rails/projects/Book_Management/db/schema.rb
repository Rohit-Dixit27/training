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

ActiveRecord::Schema[7.0].define(version: 2023_02_10_114524) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lock_version"
    t.integer "books_count"
    t.string "address"
    t.decimal "salary", precision: 10, scale: 2
    t.date "date_of_birth"
    t.string "gender"
    t.string "contact"
    t.date "join_date"
    t.date "resign_date"
  end

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "description", limit: 30
    t.string "title", comment: "enter title only"
    t.bigint "author_id"
    t.decimal "price", precision: 5, scale: 2
  end

  create_table "orders", force: :cascade do |t|
    t.string "card_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_type"
    t.integer "amount"
    t.boolean "status"
    t.bigint "book_id"
    t.index ["book_id"], name: "index_orders_on_book_id"
  end

  add_foreign_key "books", "authors", on_delete: :cascade
  add_foreign_key "orders", "books"
end
