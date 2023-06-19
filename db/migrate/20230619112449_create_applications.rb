class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :application_date, null: false
      t.string :urn, null: false
      t.references :applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
