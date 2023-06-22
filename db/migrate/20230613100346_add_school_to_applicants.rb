class AddSchoolToApplicants < ActiveRecord::Migration[7.0]
  def change
    add_reference :applicants, :school, foreign_key: true
  end
end
