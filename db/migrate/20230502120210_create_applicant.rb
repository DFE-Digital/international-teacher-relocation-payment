class CreateApplicant < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.text :first_names
      t.text :last_names
      t.text :email
      t.text :phone_number
      t.date :date_of_birth
      # t.text :address
      t.text :nationality
      t.text :gender
      t.text :marital_status
      t.text :national_insurance_number
      t.text :passport_number
      t.text :school_name
      # t.text :school_address
      # t.text :contact_details
      t.text :contract_type
      t.text :subject
      t.text :visa_type
      t.date :date_of_entry

      t.timestamps
    end
  end
end
