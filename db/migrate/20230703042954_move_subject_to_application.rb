class MoveSubjectToApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :applications, :subject, :string
  end
end
