class CreateApplicantProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :applicant_progresses do |t|
      t.references :applicant, null: false, foreign_key: true
      t.date :initial_checks_completed_at
      t.boolean :visa_investigation_required
      t.date :home_office_checks_completed_at
      t.boolean :school_investigation_required
      t.date :school_checks_completed_at

      t.timestamps
    end
  end
end
