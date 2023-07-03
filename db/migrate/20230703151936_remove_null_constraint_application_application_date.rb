class RemoveNullConstraintApplicationApplicationDate < ActiveRecord::Migration[7.0]
  def change
    change_column_null :applications, :application_date, true
  end
end
