class RenameTableApplicantProgressToApplicationProgress < ActiveRecord::Migration[7.0]
  def change
    rename_table :applicant_progresses, :application_progresses
  end
end
