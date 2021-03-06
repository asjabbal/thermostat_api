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

ActiveRecord::Schema.define(version: 2019_06_08_084703) do

  create_table "readings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "thermostat_id"
    t.integer "tracking_number"
    t.float "temperature"
    t.float "humidity"
    t.float "battery_charge"
    t.index ["thermostat_id"], name: "index_readings_on_thermostat_id"
    t.index ["tracking_number", "thermostat_id"], name: "index_readings_on_tracking_number_and_thermostat_id", unique: true
  end

  create_table "thermostats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "household_token"
    t.text "location"
    t.index ["household_token"], name: "index_thermostats_on_household_token", unique: true
  end

  add_foreign_key "readings", "thermostats"
end
