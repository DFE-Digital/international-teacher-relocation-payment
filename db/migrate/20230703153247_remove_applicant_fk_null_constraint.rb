class RemoveApplicantFkNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null :applications, :applicant_id, true
  end
end
