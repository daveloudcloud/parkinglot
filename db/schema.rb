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

ActiveRecord::Schema.define(version: 2022_06_15_092838) do

  create_table "archives", force: :cascade do |t|
    t.string "plate_number"
    t.string "vehicle_type"
    t.string "client_type"
    t.boolean "overnight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "employee_email"
    t.integer "employee_id"
    t.string "admittance_time"
    t.string "admittance_date"
    t.string "exit_date"
    t.string "exit_time"
    t.integer "amount_paid"
  end

  create_table "customers", force: :cascade do |t|
    t.string "plate_number"
    t.string "vehicle_type"
    t.string "reference_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "overnight"
    t.string "client_type"
    t.string "employee_email"
    t.integer "employee_id"
    t.string "admittance_date"
    t.string "admittance_time"
    t.integer "start_time"
    t.integer "end_time"
    t.integer "balance"
    t.string "exit_time"
    t.string "exit_date"
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "parkings", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "slots", force: :cascade do |t|
    t.integer "total_space"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "parking_id"
  end

end
