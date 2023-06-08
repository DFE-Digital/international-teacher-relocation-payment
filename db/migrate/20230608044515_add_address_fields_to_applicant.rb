class AddAddressFieldsToApplicant < ActiveRecord::Migration[7.0]
  def change
    add_column :applicants, :address_line_1, :string
    add_column :applicants, :address_line_2, :string
    add_column :applicants, :city, :string
    add_column :applicants, :county, :string
    add_column :applicants, :postcode, :string
  end
end
