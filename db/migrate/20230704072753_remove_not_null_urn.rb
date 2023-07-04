class RemoveNotNullUrn < ActiveRecord::Migration[7.0]
  def change
    change_column_null :applications, :urn, true
  end
end
