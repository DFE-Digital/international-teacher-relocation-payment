class RemoveColumnsFromApplicants < ActiveRecord::Migration[7.0]
  def change
    change_table(:applicants, bulk: true) do |_t|
      remove_column(:applicants, :initial_checks_completed_at, :date)
      remove_column(:applicants, :visa_investigation_required, :boolean)
      remove_column(:applicants, :home_office_checks_completed_at, :date)
      remove_column(:applicants, :school_investigation_required, :boolean)
      remove_column(:applicants, :school_checks_completed_at, :date)
    end
  end
end
