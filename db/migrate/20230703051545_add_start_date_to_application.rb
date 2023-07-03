class AddStartDateToApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :applications, :start_date, :date
  end
end
