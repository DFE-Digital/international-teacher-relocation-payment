class CreateApplicant < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.text :given_name
      t.text :family_name
      t.text :email_address
      t.text :phone_number
      t.date :date_of_birth
      t.text :sex
      t.text :passport_number
      t.text :school_name
      t.text :school_headteacher_name
      t.text :subject
      t.text :visa_type
      t.date :date_of_entry

      t.timestamps
    end
  end
end
