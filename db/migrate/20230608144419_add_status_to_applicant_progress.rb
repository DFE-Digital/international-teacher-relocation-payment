class AddStatusToApplicantProgress < ActiveRecord::Migration[7.0]
  def change
    add_column :applicant_progresses, :status, :integer
  end
end
