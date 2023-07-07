class AddRejectionReasonToApplicationProgress < ActiveRecord::Migration[7.0]
  def change
    add_column(:application_progresses, :rejection_reason, :text)
  end
end
