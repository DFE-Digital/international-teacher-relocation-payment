# frozen_string_literal: true

class AddProgressFieldsToApplicant < ActiveRecord::Migration[7.0]
  def change
    change_table :applicants, bulk: true do |t|
      t.date :initial_checks_completed_at
      t.boolean :visa_investigation_required, default: false, null: false
      t.date :home_office_checks_completed_at
      t.boolean :school_investigation_required, default: false, null: false
      t.date :school_checks_completed_at
    end
  end
end
