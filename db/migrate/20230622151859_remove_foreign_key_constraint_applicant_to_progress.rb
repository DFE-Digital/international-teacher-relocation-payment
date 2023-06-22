class RemoveForeignKeyConstraintApplicantToProgress < ActiveRecord::Migration[7.0]
  def change
    remove_column :applicant_progresses, :applicant_id, :bigint
  end
end
