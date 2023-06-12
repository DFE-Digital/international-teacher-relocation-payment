class RemoveApplicantIdFromSchool < ActiveRecord::Migration[7.0]
  def change
    remove_column :schools, :applicant_id, :bigint
  end
end
