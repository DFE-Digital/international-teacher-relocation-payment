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

ActiveRecord::Schema[7.0].define(version: 2023_05_02_120210) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: :cascade do |t|
    t.text "given_name"
    t.text "family_name"
    t.text "email_address"
    t.text "phone_number"
    t.date "date_of_birth"
    t.text "nationality"
    t.text "gender"
    t.text "marital_status"
    t.text "national_insurance_number"
    t.text "passport_number"
    t.text "school_name"
    t.text "subject"
    t.text "visa_type"
    t.date "date_of_entry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
