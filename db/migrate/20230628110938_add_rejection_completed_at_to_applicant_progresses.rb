class AddRejectionCompletedAtToApplicantProgresses < ActiveRecord::Migration[7.0]
  def change
    add_column(:application_progresses, :rejection_completed_at, :date)
  end
end
