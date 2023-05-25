# frozen_string_literal: true

class AddProgressFieldsToApplicant < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :initial_checks_completed_at, :date
    add_column :applicants, :visa_investigation_required, :boolean
    add_column :applicants, :home_office_checks_completed_at, :date
    add_column :applicants, :school_investigation_required, :boolean
    add_column :applicants, :school_checks_completed_at, :date
  end
end
