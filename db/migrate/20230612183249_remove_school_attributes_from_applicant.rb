class RemoveSchoolAttributesFromApplicant < ActiveRecord::Migration[7.0]
  def change
    remove_column :applicants, :school_name, :text
    remove_column :applicants, :school_headteacher_name, :text
    remove_column :applicants, :school_postcode, :string
  end
end
