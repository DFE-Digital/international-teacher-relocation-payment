class RemoveOldColumnsFromApplicant < ActiveRecord::Migration[7.0]
  def change
    remove_column :applicants, :subject, :string
    remove_column :applicants, :visa_type, :string
    remove_column :applicants, :date_of_entry, :date
  end
end
