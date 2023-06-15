class RemoveAddressColumnsFromApplicant < ActiveRecord::Migration[7.0]
  def change
    remove_column :applicants, :address_line_1, :string
    remove_column :applicants, :address_line_2, :string
    remove_column :applicants, :city, :string
    remove_column :applicants, :county, :string
    remove_column :applicants, :postcode, :string
  end
end
