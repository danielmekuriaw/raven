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

ActiveRecord::Schema.define(version: 2021_06_24_191655) do

  create_table "airlines", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_destinations"
    t.string "localized"
    t.string "description"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "airline_id"
    t.string "description_of_review"
    t.integer "rating"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "airline_id"
    t.integer "price"
    t.string "ticket_number"
    t.integer "baggage"
    t.string "origin"
    t.string "destination"
    t.string "departure_time"
    t.string "arrival_time"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "employment_status"
    t.integer "age"
    t.string "purpose_of_travel"
  end

end
