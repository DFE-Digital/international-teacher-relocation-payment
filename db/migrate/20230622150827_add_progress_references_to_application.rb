class AddProgressReferencesToApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :applicant_progresses, :application_id, :bigint
  end
end
