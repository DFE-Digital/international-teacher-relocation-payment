class MoveVisaTypeToApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :applications, :visa_type, :string
  end
end
