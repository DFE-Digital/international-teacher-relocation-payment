class RemoveColumnsFromApplicants < ActiveRecord::Migration[7.0]
  def change
    change_table :applicants, bulk: true do |t|
      t.remove :initial_checks_completed_at
      t.remove :visa_investigation_required
      t.remove :home_office_checks_completed_at
      t.remove :school_investigation_required
      t.remove :school_checks_completed_at
    end
  end
end
